<?php
require_once('profile_db.php');
require_once('others.php');
define('USER_INTERFACE_LANGUAGE', 'RU');
define ('DSN','root:abufct@localhost/trackit_prod/utf8/');
$DB = new DB (DSN);
if (!$DB->LOADED) 
{
    echo  ('<div align="center"><font color="red"><b>Database overloaded. <br>Please return later or use main version of our service.<br>Some functions of service may not work properly</b></font></div>');
}
$cont ='';
if (USER_INTERFACE_LANGUAGE == 'RU' or USER_INTERFACE_LANGUAGE =='UA'){	$PLNG ='RU';$PLNG2='RU2';}else {$PLNG2=$PLNG = 'EN';}
$shoptype[0]='Auction/Trading board';
$shoptype[1]='Retailer';
$shoptype[2]='Manufacturer Shop';
$shoptype[3]='Brand Retailer';
$shoptype[6]='Shopping Mall';
$shoptype[7]='Official Dealer';
$shoptype[8]='Outlet';
$shoptype[9]='Dropshipper';
if(isset($_REQUEST['sl_submit']))
{
	$out = sl_submit();
}
else
{
	if(isset($_REQUEST['shop'])&&preg_match('/^\d+$/',$_REQUEST['shop']))
	{
		$LIST = $DB->Query("SELECT * FROM shop_names WHERE id ='".$_REQUEST['shop']."' order by title")->One()->Out();
		if(count($LIST) !== 0)
		{
			$contacts=json_decode($LIST['contacts']);
			$cont .='<h2>'.$LIST['title'].'</h2>';
			$cont .='<div class="col-md-4">
						<center>
						<div class="btn btn-default">'.set_shop_image($LIST['link']).'</div><br>
						<div ><a href="/away.php?to='.$LIST['link'].'"><b>'.$LIST['link'].'</b></a></div>
					<div ><b>'.$shoptype[$LIST['type']].' /'.$COUNTRY[$LIST['country']][$PLNG].'</b></div>
					</center></div>';
	
			$cont .='<div class="col-md-8">';
				$cont .='<div><b>Customer support: </b><br></div>';
				if (isset($contacts->phone))
				{
					foreach($contacts->phone as $k1=>$v)
					{
						$cont .='<div class="col-md-1"></div>
								<div >Phone: '.$v->value;
						if($v->title<>''){$cont .=' ('.$v->title.')';}
						$cont .='</div>';
					}
				}
				if (isset($contacts->fax))
				{
					foreach($contacts->fax as $k1=>$v)
					{
						$cont .='<div class="col-md-1"></div><div >
						Fax: '.$v->value;
						if($v->title<>''){$cont .=' ('.$v->title.')';}
						$cont .='</div>';
					}
				}
				if (isset($contacts->email))
				{
					foreach($contacts->email as $k1=>$v)
					{
						$cont .='<div class="col-md-1"></div><div >Email: '.$v->value;
						if($v->title<>''){$cont .=' ('.$v->title.')';}
						$cont .='</div>';
					}
				}
				$worktime = '';
				if (isset($contacts->worktime))
				{
					$worktime = $contacts->worktime;
				}
				$cont .='<div><b>Business Hours:</b> </div><div class="col-md-1"></div><div>'.$worktime.'&nbsp;</div>';	
				
				$TAGS = $DB->Query("SELECT * FROM shoplist_tag d  LEFT JOIN shoplist_tag_list f ON d.tag =f.id WHERE d.shop_id ='".$_REQUEST['shop']."'")->Out();
				$tags_out = '';
				if (isset($TAGS))
				{
					foreach($TAGS as $key=>$value)
					{
						if($tags_out !== '')
						{
							$tags_out .= ', ';
						}
						$tags_out .='<a href="">'.$value[$PLNG].'</a>';
					}
				}
				$cont .='<div><b>Tags:</b></div><div class="col-md-1"></div><div>'.$tags_out.'</div>';
			$cont .='</div>';
			
			$cont .='<div class="col-md-12">
					<div class="infospan">
				<div class="btn-group btn-group-justified mobile-hide">
					<a href="#info_about" class="btn btn-default switch">О магазине</a>
					<a href="#info_feedback" class="btn btn-default switch">Отзывы</a>
					<a href="#info_news" class="btn btn-default switch">Новости</a>
					<a href="#info_offers" class="btn btn-default switch">Купоны</a>
				</div>
				<div class="btn-group btn-group-vertical mobile-view">
					<a href="#info_about" class="btn btn-default switch">О магазине</a>
					<a href="#info_feedback" class="btn btn-default switch">Отзывы</a>
					<a href="#info_news" class="btn btn-default switch">Новости</a>
					<a href="#info_offers" class="btn btn-default switch">Купоны</a>
				</div>
				<div class="info">
					<div style="display: none;" id="info_about" class="text">';
					$cont .='<div><p>';
					if (isset($LIST['text']))
					{
						$text = json_decode($LIST['text']);
						if($text->text->$PLNG != '')
						{
							$cont .=$text->text->$PLNG;
						}
						else
						{
							$cont .='[NODATA]';
						}
					}
					else
					{
						$cont .='[NODATA]';
					}
					$cont .='</p></div>';
					$cont .='<div><b>Addresses: </b></div>';
					if (isset($contacts->address))
					{
						foreach($contacts->address as $k1=>$v)
						{
							$cont .='<div >';
							if($v->title<>''){$cont .=' <b>'.$v->title.':</b></div>';}
							else{$cont .='</div>';}
							$cont .='<div class="col-md-1"></div><div>'.$v->value;
							if($v->worktime<>''){$cont .='<br><div class="col-md-1"></div><i>Business hours:</b>'.$v->worktime.'</i>';}
							$cont .='</div>';
	
			
						}	
					}
					$cont.='</div>
					<div style="display: none;" id="info_feedback" class="text" align="left">
						<h3>Наш сервис поможет Вам</h3><ul><li>отследить ваши регистрированные почтовые отправленяе по их номерам (идентификатору, трекинг номеру, РПО) более 400 почтово транспортных компаний всего мира;</li><li>узнать где посылка находится в данный момент;</li><li>автоматически определить компанию, которая доставляет вашу посылку по её номеру, транспортной накладной или авианакладной;</li><li>получить данные на удобном Вам языке (Английский, Русский, Немецкий, Польский, Итальянский, Западно Украинский);</li><li>хранить и автоматически отслеживать все Ваши отправления в персональном кабинете;</li><li>извещать Вашего клиента или друга о движении вашей посылки используя e-mail;</li></ul>
					</div>
					<div style="display: block;" id="info_news" class="text" align="left">
						<p></p><h3>Как отследить посылку?</h3><p></p> <p>Для того чтобы отследить посылку Вам нужен только <b>номер отправления</b>, все остальное для Вас сделает наш сервис!</p><p></p><ul><li>1. Введите номер Вашего отправления в поле <b>Номер отправления</b>.</li><li>2. Выберите страну назначения в поле <b>Куда?</b></li> <li>3. Если Ваше отправление имеет формат отличный от формата Всемирного почтового союза (AB123456789CD), то для точности определения почтового перевозчика, выберите службу, которой было отправлено Ваше отправление в поле <b>Какой службой?</b></li><li>4. Введите код безопасности и нажмите кнопку поиска.</li><li>5. Получите результат проверки Вашего почтового отправления.</li><li>В случае, если Наш сервис не сможет в автоматическом режиме распознать службу, которой было отправлено Ваше отправление, отправьте сообщение через онлайн чат с указанием номера почтового отправления и службы, которой было отправлено Ваше отправление, и Мы постараемся добавить отслеживание таких номеров на нашем сервисе в кратчайшие сроки.</li><li><!--noindex--><a href="http://tonnasovetov.ru/hitech/tracking-mail/" target="_blank" rel="nofollow">Краткая инструкция по пользованию от наших друзей</a><!--/noindex-->.</li></ul><p></p>
					</div>
					<div style="display: block;" id="info_offers" class="text" align="left">
						<p></p><h3>Как отследить посылку?</h3><p></p> <p>Для того чтобы отследить посылку Вам нужен только <b>номер отправления</b>, все остальное для Вас сделает наш сервис!</p><p></p><ul><li>1. Введите номер Вашего отправления в поле <b>Номер отправления</b>.</li><li>2. Выберите страну назначения в поле <b>Куда?</b></li> <li>3. Если Ваше отправление имеет формат отличный от формата Всемирного почтового союза (AB123456789CD), то для точности определения почтового перевозчика, выберите службу, которой было отправлено Ваше отправление в поле <b>Какой службой?</b></li><li>4. Введите код безопасности и нажмите кнопку поиска.</li><li>5. Получите результат проверки Вашего почтового отправления.</li><li>В случае, если Наш сервис не сможет в автоматическом режиме распознать службу, которой было отправлено Ваше отправление, отправьте сообщение через онлайн чат с указанием номера почтового отправления и службы, которой было отправлено Ваше отправление, и Мы постараемся добавить отслеживание таких номеров на нашем сервисе в кратчайшие сроки.</li><li><!--noindex--><a href="http://tonnasovetov.ru/hitech/tracking-mail/" target="_blank" rel="nofollow">Краткая инструкция по пользованию от наших друзей</a><!--/noindex-->.</li></ul><p></p>
					</div>
	
				</div>
			</div>
				</div>	
					
					';
	
		}
	}
	elseif(isset($_REQUEST['from'])&&preg_match('/^[A-Z]{2}$/',$_REQUEST['from']))
	{
		$cont .='<h2>International shop list - '.$COUNTRY[$_REQUEST['from']][$PLNG2].'</h2>';
		$LIST = $DB->Query("SELECT * FROM shop_names WHERE country ='".$_REQUEST['from']."' order by title")->Out();
		foreach($LIST as $key=>$value)
		{
	//		$cont .='<br>'.json_encode($value);
			$cont .='<div class="btn btn-default col-md-6"><div class="btn btn-default col-md-4">'.set_shop_image($value['link']).' <br><b>rating stars</b></div><div class="col-md-8"><b><a href="?service=sl&shop='.$value['id'].'" >'.$value['title'].'</a><br></b> ('.$shoptype[$value['type']].')<br>10 reviews/  10 Offers</div></div>';
		}
	}
	else
	{
		$cont .='<h2>International shop list</h2>';
		$LIST = $DB->Query("SELECT COUNT(id) AS q,country FROM shop_names GROUP BY country ORDER BY country")->Out();
		foreach($LIST as $key=>$value)
		{
	//		$cont .='<br>'.json_encode($value);
			$cont .='<div class="btn btn-default col-md-6"><a href="?service=sl&from='.$value['country'].'" ><img src="/pics/flag/'.strtolower($value['country']).'.png">&nbsp;<b>'.$COUNTRY[$value['country']][$PLNG].' ('.$value['q'].')</b></div>';
		}
	}
	
	$cont .='';
	$out = $cont;
}

function sl_submit()
{
 	global $DB;
	global $SHOP_TYPES;
	global $COUNTRY;
	global $LANGUAGES;
	$out = file_get_contents('./profile/shoplist_submit.html');
	$CAT = $DB->Query ("SELECT DISTINCT  cat_id \"0\", cat_name \"1\" FROM cat WHERE CODE ='EBAY-US' ORDER BY cat_name")->out ();
	$PAY = $DB->Query ("SELECT id \"0\", title \"1\" FROM payment_types ORDER BY title")->out ();
	foreach($COUNTRY as $key=>$value)
	{
		$COUNTRY_LIST[]=array($value['CODE'],$value['EN']);
	}
	$COUNTRY_LIST[]=array('WWW','Worldwide');
	$COUNTRY_LIST[]=array('SOR','Seller Defined');
	$COUNTRY_LIST[]=array('GSX','GlobalShipex');
	$COUNTRY_LIST[]=array('SPT','Shipito');
	//echo json_encode($_REQUEST);
	if (isset($_REQUEST['add']))
	{
		if($_REQUEST['SL_LINK']<>'')
		{
			//link pre check
			$LINK = $DB->Query ("SELECT * FROM shop_names WHERE link ='".$_REQUEST['SL_LINK']."'")->One()->out ();
			echo json_encode($LINK).' '.count($LINK);
			if(count($LINK)>0){	$ITEM['WARNING']='Shop exist';}
			else
			{
				$ITEM['SL_LINK_VALUE']=$_REQUEST['SL_LINK'];
				$ITEM['SL_TITLE_VALUE']=$_REQUEST['SL_TITLE'];
				$ITEM['SHOP_TYPE_VALUE']=Do_select($SHOP_TYPES,$_REQUEST['SL_TYPE']);
				$ITEM['SL_TAG_VALUE']=Do_select($CAT,$_REQUEST['SL_TAG']);
				$ITEM['SL_CS_EMAIL_VALUE']=$_REQUEST['SL_CS_EMAIL'];
				$ITEM['SHOP_ORIGIN']=Do_select($COUNTRY_LIST,$_REQUEST['SL_ORIGIN']);
				$ITEM['SL_CS_PHONE_VALUE']=$_REQUEST['SL_CS_PHONE'];
				$ITEM['SL_CS_FAX_VALUE']=$_REQUEST['SL_CS_FAX'];
				$ITEM['SL_CS_BTIME_VALUE']=$_REQUEST['SL_CS_BTIME'];
				$ITEM['SL_PAYMENT_VALUE']=Do_select($PAY,$_REQUEST['SL_PAYMENT']);
				$ITEM['SL_SHIPPING_VALUE']=Do_select($COUNTRY_LIST,$_REQUEST['SL_SHIPPING']);
				$ITEM['SL_LANGUAGE_VALUE']=Do_select($LANGUAGES,$_REQUEST['SL_LANGUAGE']);
				
				$ITEM['SL_ADDRESS_VALUE']=trim($_REQUEST['SL_ADDRESS']);
				$ITEM['SL_DESCRIPTION_VALUE']=trim($_REQUEST['SL_DESCRIPTION']);
			}
			
		}
		else{	$ITEM['WARNING']='No link';}
		
	}
	else
	{
		
		$ITEM['SL_TAG_VALUE']=Do_select($CAT,'');
		$ITEM['SHOP_TYPE_VALUE']=Do_select($SHOP_TYPES,'');
		$ITEM['SHOP_ORIGIN']=Do_select($COUNTRY_LIST,'');
		$ITEM['SL_SHIPPING_VALUE']=Do_select($COUNTRY_LIST,'');
		$ITEM['SL_LANGUAGE_VALUE']=Do_select($LANGUAGES,'');
		$ITEM['SL_PAYMENT_VALUE']=Do_select($PAY,'');
	}
	return parse_tags($out,$ITEM);
}
echo $out;
?>