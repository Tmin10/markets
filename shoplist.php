<?php

$cont = '';
if (USER_INTERFACE_LANGUAGE == 'RU' || USER_INTERFACE_LANGUAGE == 'UA')
{	
  $PLNG = 'RU';
  $PLNG2 = 'RU2';
}
else 
{
  $PLNG2 = $PLNG = 'EN';
}
$shoptype[0] = 'Auction/Trading board';
$shoptype[1] = 'Retailer';
$shoptype[2] = 'Manufacturer Shop';
$shoptype[3] = 'Brand Retailer';
$shoptype[6] = 'Shopping Mall';
$shoptype[7] = 'Official Dealer';
$shoptype[8] = 'Outlet';
$shoptype[9] = 'Dropshipper';
if(isset($_REQUEST['sl_submit']))
{
	$out = sl_submit();
}
else
{
	if(filter_has_var(INPUT_GET, 'shop')&&preg_match('/^\d+$/',$_REQUEST['shop']))
	{
            $shop = (int) filter_input(INPUT_GET, 'shop', FILTER_SANITIZE_NUMBER_INT);
		$LIST = $DB->Query("SELECT * FROM shop_names WHERE id ='".$_REQUEST['shop']."' order by title")->One()->Out();
		if(count($LIST) !== 0)
		{
			$contacts = json_decode($LIST['contacts']);
			$cont .= '<h2>'.$LIST['title'].'</h2>';
			$cont .= '<div class="col-md-4">
						<center>
						<div class="btn btn-default">'.set_shop_image($LIST['link']).'</div><br>
						<div ><a href="http://trackitonline.ru/away.php?to='.$LIST['link'].'"><b>'.$LIST['link'].'</b></a></div>
					<div ><b>'.$shoptype[$LIST['type']].' /'.$COUNTRY[$LIST['country']][$PLNG].'</b></div>
					</center></div>';
	
			$cont .= '<div class="col-md-8">';
				$cont .= '<div><b>Customer support: </b><br></div>';
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
          
<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#about" aria-controls="home" role="tab" data-toggle="tab">О магазине</a></li>
    <li role="presentation" class="active"><a href="#reviews" aria-controls="profile" role="tab" data-toggle="tab">Отзывы</a></li>
    <li role="presentation"><a href="#news" aria-controls="messages" role="tab" data-toggle="tab">Новости</a></li>
    <li role="presentation"><a href="#coupons" aria-controls="settings" role="tab" data-toggle="tab">Купоны</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane" id="about">...1</div>
    <div role="tabpanel" class="tab-pane active" id="reviews">';
    
    if (!($DB->Count('reviews', "parent_id = '$shop' AND is_comment = 0 AND user_id = '$user_id'")>0))
    {
      $cont .= '<form class="form-horizontal" id="post-review">
                  <div class="form-group star">
                    <label class="col-sm-4">Скорость обработки заказа</label>
                    <div class="col-sm-8">
                      <input name="speed" value="3" class="rating-stars" data-step=1 data-size="xs">
                    </div>
                  </div>
                  <div class="form-group star">
                    <label class="col-sm-4">Отзывчивость продавца</label>
                    <div class="col-sm-8">
                      <input name="responsibility" value="3" class="rating-stars" data-step=1 data-size="xs">
                    </div>
                  </div>
                  <div class="form-group star">
                    <label class="col-sm-4">Качество товара</label>
                    <div class="col-sm-8">
                      <input value="3" name="quality" class="rating-stars" data-step=1 data-size="xs" >
                    </div>
                  </div>
                  <div class="form-group star">
                    <label class="col-sm-4">Общая оценка</label>
                    <div class="col-sm-8">
                      <input value="3" name="summary" class="rating-stars" data-step=1 data-size="xs">
                    </div>
                  </div>
                  <div class="form-group" class="language-select">
                    <label>Язык отзыва</label>
                    <select class="form-control" name="language[]">
                      <option value="1">Русский</option>
                      <option value="2">English</option>
                    </select>
                  </div>
                  <div class="form-group review-text">
                    <label>Текст отзыва</label>
                    <textarea class="form-control" name="review[]" rows="3"></textarea>
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-default">Оставить отзыв</button>
                    <button type="submit" id="add-language" class="btn btn-warning">Добавит отзыв на другом языке</button>
                  </div>
                  <input type="hidden" name="type" value="post_review"/>
                  <input type="hidden" name="parent" value="'.$shop.'"/>
                </form>
                <div class="review-box">';
    }
    $reviews = $DB->Query('SELECT reviews.id, reviews_text.id, text, language_id, user_id, rating_up, rating_down, rating_speed,'
                          . ' rating_responsibility, rating_quality, rating_summary, ('
                                                                                    . 'SELECT COUNT(*) '
                                                                                    . 'FROM reviews_text '
                                                                                    . 'WHERE reviews_text.review_id = reviews.id'
                                                                                    . ') as languages '
                        . 'FROM reviews '
                        . 'JOIN reviews_text ON reviews_text.review_id = reviews.id '
                        . "WHERE parent_id = '$shop' AND is_comment = 0 AND reviews_text.language_id = 1")->Out();
    if (count($reviews) === 0)
    {
      $cont .= "У данного магазина пока нет отзывов, оставьте первый.";
    }
    else
    {
      foreach ($reviews as $review) 
      {
        $cont .= 'Юзер: '.$review['user_id'].'<br />';
        $cont .= '&#8679; '.$review['rating_up'].'&#8681; '.$review['rating_down'].'<br />';
        $cont .= 'Скорость обработки заказа: '.$review['rating_speed'].'<br />';
        $cont .= 'Отзывчивость продавца: '.$review['rating_responsibility'].'<br />';
        $cont .= 'Качество товара: '.$review['rating_quality'].'<br />';
        $cont .= 'Общая оценка: '.$review['rating_summary'].'<br />';
        if ($review['languages'] > 1)
        {
             $cont .= 'Отзыв доступен на других языках.<br />';
        }
        $cont .= '-----------<br />';
        $cont .= $review['text'].'<br />';
        
      }
    }
    $cont .= '</div>
      </div>
    <div role="tabpanel" class="tab-pane" id="news">...3</div>
    <div role="tabpanel" class="tab-pane" id="coupons">...4</div>
  </div>

</div>
				
			</div>
				</div>	
					
					';
	
		}
	}
	elseif(filter_has_var(INPUT_GET ,'from')&&preg_match('/^[A-Z]{2}$/',$_REQUEST['from']))
	{
            $from = filter_input(INPUT_GET, 'from');
            $cont .='<h2>International shop list - '.$COUNTRY[$from][$PLNG2].'</h2>';
            $LIST = $DB->Query("SELECT id, title, `type` , link, (
                                                                    SELECT COUNT( * )
                                                                    FROM reviews
                                                                    WHERE reviews.parent_id = shop_names.id
                                                                 ) AS reviews
                                FROM shop_names
                                WHERE country = '$from'")->Out();
            foreach($LIST as $key => $value)
            {
            //		$cont .='<br>'.json_encode($value);
            $cont .='<div class="btn btn-default col-md-6"><div class="btn btn-default col-md-4">'.set_shop_image($value['link']).' <br><b>rating stars</b></div><div class="col-md-8"><b><a href="?service=sl&shop='.$value['id'].'" >'.$value['title'].'</a><br></b> ('.$shoptype[$value['type']].')<br>'.$value['reviews'].' reviews</div></div>';
            }
	}
	else
	{
		$cont .='<h2>International shop list</h2>';
		$LIST = $DB->Query("SELECT COUNT(id) AS q,country FROM shop_names GROUP BY country ORDER BY country")->Out();
		foreach($LIST as $key=>$value)
		{
	//		$cont .='<br>'.json_encode($value);
			$cont .='<div class="btn btn-default col-md-6"><a href="?service=sl&from='.$value['country'].'" ><img src="http://trackitonline.ru//pics/flag/'.strtolower($value['country']).'.png">&nbsp;<b>'.$COUNTRY[$value['country']][$PLNG].' ('.$value['q'].')</b></div>';
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