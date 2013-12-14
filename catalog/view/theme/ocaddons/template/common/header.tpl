<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- google fonts -->
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Exo:300,400,600,700|Open+Sans:400,600,700" />
<!-- google fonts /-->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ocaddons/stylesheet/stylesheet.min.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/ocaddons/js/all.min.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/ocaddons/stylesheet/ie.css" />
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="primary-define color-red<?php if (preg_match('#MSIE (.+?);#', $this->request->server['HTTP_USER_AGENT'], $matches) && intval($matches[1]) < 9) echo ' is-ie'; ?>">
<div id="header">
<div id="topbar">
<div class="wrapper clearafter">
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <div class="links">
    <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="icon-wishlist"><?php echo $text_wishlist; ?></a>
    <a href="<?php echo $account; ?>" id="link-account" class="icon-user"><?php echo $text_account; ?></a>
    <a href="<?php echo $shopping_cart; ?>" id="link-cart" class="icon-cart"><?php echo $text_shopping_cart; ?></a>
    <a href="<?php echo $checkout; ?>" id="link-checkout" class="icon-checkout"><?php echo $text_checkout; ?></a>
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
</div>
</div>
<div id="toppanel">
<div class="wrapper clearafter">
  <div id="logo"><a href="<?php echo $home; ?>">OCAddons</a></div>
  <?php echo $cart; ?>
  <div id="search">
  <div id="search-inner">
        <div class="button-search"></div>
        <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  </div>
</div>
</div>
<?php if ($categories) { ?>
<div id="menu">
<div id="menu-inner">
<div class="wrapper clearafter">
  <ul class="mainmenu clearafter">
  	<li class="item<?php echo ((empty($_GET['_route_']) && empty($_GET['route'])) || (isset($_GET['route']) && $_GET['route'] == 'common/home')) ? ' active' : '' ?>"><a href="index.php" title="Home">Home</a></li>
	<?php $path = isset($this->request->get['path']) ? $this->request->get['path'] : ''; ?>
	<?php $cate = $path ? (int) $path : ''; ?>
    <?php foreach ($categories as $category) { ?>
	<?php $category_id = (int) substr($category['href'], strpos($category['href'], 'path=') + 5); ?>
    <li class="item<?php echo count($category['children']) ? ' parent' : '' ?><?php echo $category_id === $cate ? ' active' : '' ?>"><a class="<?php echo $category_id === $cate ? 'current' : '' ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div class="dropdown-container">
		<div class="dropdown clearafter" style="width: <?php echo ($category['column'] * 250); ?>px;">
		<?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <?php $children_id = substr($category['children'][$i]['href'], strpos($category['children'][$i]['href'], 'path=') + 5); ?>
          <li<?php echo $path === $children_id ? ' class="item active"' : ' class="item"' ?>><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
		</div>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
  <?php if(isset($this->request->get['_route_'])) { ?>
      <script type="text/javascript">
          var base = "<?php echo $base ?>";
          var router = "<?php echo isset($this->request->get['_route_']) ? $this->request->get['_route_'] : '' ?>";
          $('.mainmenu > li ul > li > a').each(function() {
              var href = $(this).attr('href');
              var route = href.replace(base, '');
              if(router.indexOf(route) === 0) {
                  $(this).parent().addClass('active');
                  $(this).parents().eq(4).addClass('active');
                  $(this).parents().eq(3).prev().addClass('current');
              }
          });
          $('.mainmenu > li > a').each(function() {
              var href = $(this).attr('href');
              var route = href.replace(base, '');
              if(router.indexOf(route) === 0) {
                  $(this).parent().addClass('active');
                  $(this).addClass('current');
              }
          });
      </script>
  <?php } ?>
  <?php } ?>
</div>
</div>
</div>
</div>
<div id="container">
<div id="container-inner" class="wrapper clearafter">
<div id="notification"></div>