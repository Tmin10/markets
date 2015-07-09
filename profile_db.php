<?php

/**
 * @company McArrow Coding Group
 * @author Alex (Sanches) McArrow
 * @copyright © McArrow Coding Group 2009-2011
 * @package DB
 * @name DB
 * @version 0.1.4
 *
 */
class DB {

    public $SELFVERSION = '0.1.4';
    public $LOADED;
    public $ERR;
    public $Q;
    private $DBC;
    private $DSN;
    private $WQ;
    private $DQ;
    private $FF;
    private $CUR;

    /**
     * Construct DB
     * @param link $DSN link to CORE
     */
    public function __construct ($DSN) {
        $this->LOADED = FALSE;
        $this->ERR = array ();
        $this->DSN = array ();
        $this->Q = array ();
        $this->WQ = array ();
        $this->DQ = array ();
        $this->FF = FALSE;
        $this->CUR = FALSE;
        if (is_string ($DSN)) {
            if (mb_eregi ('^([^:]+):([^@]+)@([^/]+)/([^\\/:*?."<>|]+)/([^\\/:*?."<>|]*)/([^\\/:*?."<>|]*)', $DSN, $DSNARRAY)) {
                list ($this->DSN['dsn'], $this->DSN['user'], $this->DSN['pass'], $this->DSN['host'], $this->DSN['dbname'], $this->DSN['charset'], $this->DSN['pref']) = $DSNARRAY;
                return $this->_driver_connect ();
            } else {
                $this->LOADED = FALSE;
                return FALSE;
            }
        } else {
            $this->LOADED = FALSE;
            return FALSE;
        }
        return $this;
    }

    /// PUBLIC
    /**
     * Destruct DB
     */
    public function __destruct () {
        $this->_run_dquery ();
        $this->_driver_disconnect ();
        return TRUE;
    }

    /**
     * Check table exist
     * @param string $table table name
     * @return boolean
     */
    public function GetID ($table, $id) {
        $this->Force ()->_returnquery ("SELECT * FROM `" . $this->DSN['pref'] . $table . "` WHERE `id` = '" . $id . "'");
        return $this;
    }

    public function Select ($table, $where = FALSE) {
        if (!$where) {
            $where = '1';
        }
        $this->Force ()->_returnquery ("SELECT * FROM `" . $this->DSN['pref'] . $table . "` WHERE " . $where);
        return $this;
    }

    public function Query ($query) {
        $this->Force ()->_returnquery ($query);
        return $this;
    }

    public function Update ($table, $id, $data) {
        $UPD = array ();
        foreach ($data as $key => $value) {
            $UPD[] = "`" . $key . "` = '" . addslashes ($value) . "'";
        }
        $query = "UPDATE `" . $this->DSN['pref'] . $table . "` SET " . implode (",", $UPD) . " WHERE `id` = '" . $id . "'";
        $this->_query ($query);
        return TRUE;
    }

    public function Update_all ($table, $where, $data) {
        $UPD = array ();
        foreach ($data as $key => $value) {
            $UPD[] = "`" . $key . "` = '" . addslashes ($value) . "'";
        }
        $query = "UPDATE `" . $this->DSN['pref'] . $table . "` SET " . implode (",", $UPD) . " WHERE " . $where . "";
        $this->_query ($query);
		//echo $query;
		die;
        return TRUE;
    }

    public function Delete ($table, $id) {
        $query = "DELETE FROM `" . $this->DSN['pref'] . $table . "` WHERE `id` = '" . $id . "'";
        $this->_query ($query);
        return TRUE;
    }

    public function DeleteWhere ($table, $where = FALSE) {
        if ($where) {
            $query = "DELETE FROM `" . $this->DSN['pref'] . $table . "` WHERE " . $where;
            $this->_query ($query);
        }
        return TRUE;
    }

    public function Insert ($table, $data) {
        $INSkey = array (
            "`id`"
        );
        $INSval = array (
            "NULL"
        );
        foreach ($data as $key => $value) {
            $INSkey[] = "`" . $key . "`";
            $INSval[] = "'" . addslashes ($value) . "'";
        }
        $query = "INSERT INTO `" . $this->DSN['pref'] . $table . "` (" . implode (",", $INSkey) . ") VALUES (" . implode (",", $INSval) . ")";
        $this->_query ($query);
        return $this;
    }

    public function Insert_noid ($table, $data) {
        $INSkey = array ();
        $INSval = array ();
        foreach ($data as $key => $value) {
            $INSkey[] = "`" . $key . "`";
            $INSval[] = "'" . addslashes ($value) . "'";
        }
        $query = "INSERT INTO `" . $this->DSN['pref'] . $table . "` (" . implode (",", $INSkey) . ") VALUES (" . implode (",", $INSval) . ")";
        $this->_query ($query);
        return $this;
    }

    public function LastID () {
        return $this->DBC->insert_id;
    }

    public function Count ($table, $where = FALSE) {
        if (!$where) {
            $where = '1';
        }
        $query = "SELECT count(`id`) as count FROM `" . $this->DSN['pref'] . $table . "` WHERE " . $where;
        $result = $this->_driver_fetch_assoc_clear ($this->_driver_query ($query));
        return $result[0]['count'];
    }

    public function One () {
        $out = array ();
        foreach ($this->WQ[$this->CUR] as $key => $value) {
            $this->WQ[$this->CUR] = $value;
            break;
        }
        return $this;
    }

    public function Force () {
        $this->FF = TRUE;
        return $this;
    }

    public function Group ($field) {
        $out = array ();
        foreach ($this->WQ[$this->CUR] as $key => $value) {
            $out[$value[$field]][$value['id']] = $value;
        }
        $this->WQ[$this->CUR] = $out;
        return $this;
    }

    public function ReOrder ($field) {
        $out = array ();
        foreach ($this->WQ[$this->CUR] as $key => $value) {
            $out[$value[$field]] = $value;
        }
        $this->WQ[$this->CUR] = $out;
        return $this;
    }

    public function KeyValue ($KVkey, $KVvalue) {
        $out = array ();
        foreach ($this->WQ[$this->CUR] as $key => $value) {
            $out[$value[$KVkey]] = $value[$KVvalue];
        }
        $this->WQ[$this->CUR] = $out;
        return $this;
    }

    public function out () {
        return $this->WQ[$this->CUR];
    }

    public function Exist ($table) {
        $query = "SELECT COUNT(*) as count FROM information_schema.tables WHERE table_schema = '" . $this->DSN['dbname'] . "' AND table_name = '" . $this->DSN['pref'] . $table . "'";
        $count = $this->_driver_fetch_assoc_clear ($this->_driver_query ($query));
        if ($count[0]['count'] == 1) {
            return true;
        } else {
            return false;
        }
    }

    public function DropTable ($table) {
        $this->_query ("DROP TABLE `" . $this->DSN['pref'] . $table . "`");
        return TRUE;
    }

    /// PUBLIC
    /// PRIVATE
    private function _run_dquery () {
        foreach ($this->DQ as $key => $value) {
            $this->_driver_query ($value);
        }
    }

    private function _returnquery ($query) {
        $hash = sha1 ($query);
        if ($this->FF) {
            $this->FF = FALSE;
            if (isset ($this->Q[$hash])) {
                $result = $this->Q[$hash];
            } else {
                $result = $this->_driver_fetch_assoc ($this->_driver_query ($query));
                $this->Q[$hash] = $result;
            }
            $this->WQ[$hash] = $result;
            $this->CUR = $hash;
            return $this;
        } else {
            $this->DQ[$hash] = $query;
            return $this;
        }
    }

    private function _query ($query) {
        $hash = sha1 ($query);
        $hash = $query;
        $result = $this->_driver_query ($query);
        $this->Q[$hash] = 'EXECUTE: ' . $query;
        return $this;
    }

    /// PRIVATE
    /// DRIVER
    private function _driver_connect () {
        $this->DBC = new mysqli ($this->DSN['host'], $this->DSN['user'], $this->DSN['pass'], $this->DSN['dbname']);
        if (!$this->DBC->connect_error) {
            if ($this->DSN['charset'] != "") {
                if ($this->DBC->set_charset ($this->DSN['charset'])) {
                    $this->LOADED = TRUE;
                    return TRUE;
                } else {
                    $this->LOADED = FALSE;
                    return FALSE;
                }
            } else {
                $this->LOADED = TRUE;
                return TRUE;
            }
        } else {
            $this->LOADED = FALSE;
            return FALSE;
        }
    }

    private function _driver_query ($query) {
        if (!$RESULT = $this->DBC->query ($query)) {
            $this->ERR[] = $this->DBC->error;
            return $this->DBC;
        } else {
            return $RESULT;
        }
    }

    private function _driver_disconnect () {
        if (is_object ($this->DBC)) {
            return $this->DBC->close ();
        } else {
            return FALSE;
        }
    }

    private function _driver_fetch_assoc ($result) {
        $retarray = array ();
        if ($this->DBC->affected_rows > 0 and !is_bool($result)) {
            while ($data = $result->fetch_assoc ()) {
                $retarray[] = $data;
            }
        }
        return $retarray;
    }

    private function _driver_fetch_assoc_clear ($result) {
        $retarray = array ();
        if ($this->DBC->affected_rows > 0 and !is_bool($result)) {
            while ($data = $result->fetch_assoc ()) {
                $retarray[] = $data;
            }
        }
        return $retarray;
    }

}
