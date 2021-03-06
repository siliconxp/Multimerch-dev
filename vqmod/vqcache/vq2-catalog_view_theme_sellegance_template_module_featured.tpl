<?php 
global $language; global $config;
$language->load('module/sellegance');

if($config->get('sellegance_featured_carousel') != '') {
	$class1= "product-slider top-arrows";
	$class2= "owl-carousel";
	$class3= "item";
} else {
	$class1= "box";
	$class2= "row";
	$class3= "product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12";
}
?>

	<div id="featured-products" class="<?php echo $class1; ?>" <?php if ($language->get('direction')=='rtl') echo 'style="direction:rtl;"'?>>

		<div class="contentset center">
			<h4 class="inner"><span><?php echo $heading_title; ?></span></h4>
		</div>

		<div class="<?php echo $class2; ?>">

			<?php foreach ($products as $product) {  ?>
				
				<div class="<?php echo $class3; ?>">

					<div class="product-thumb transition">

						<?php if ($product['price'] && $product['special']) { ?>
						<span class="onsale"><?php echo $language->get('text_onsale'); ?></span>
						<?php } ?>

						<div class="image hover_fade_in_back">

				<div class="quickview" style="visibility:hidden;"><a id="qv<?php echo $product['product_id']; ?>" class="button btn btn-default" rel="mp-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" ><?php echo $language->get('text_quickview'); ?> <i class="fa fa-expand"></i></a></a></div>
			
						<?php if ( $product['thumb'] && isset($product['thumb_swap']) && $config->get('sellegance_rollover_images')==1) { ?>
							<div class="front-image">
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
							</div>
							<div class="back-image">
								<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb_swap']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>"/></a>
							</div>
						<?php } else if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
						<?php } ?>
						</div>
						
						<div class="caption">

							<h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

							<?php if ($product['price']) { ?>
							<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
							</div>
							<?php } ?>

							<div class="cart">
								<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="btn btn-default btn-sm btn-cart"><?php echo $button_cart; ?></button>
								<button type="button" data-toggle="tooltip" class="btn btn-default btn-sm wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
								<button type="button" data-toggle="tooltip" class="btn btn-default btn-sm compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
							</div>

							<?php if ($product['rating']) { ?>
							<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } ?>
								<?php } ?>
							</div>
							<?php } ?>

						</div> <!-- .caption -->

					</div> <!-- .product-thumb -->
				
				</div> <!-- .item, .product-layout -->

			<?php } ?>

		</div><!-- .owl-carousel, .box -->

	</div>

	<?php if($config->get('sellegance_featured_carousel') != '') { ?>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#featured-products .owl-carousel').owlCarousel({
				items: 4,
				<?php if($config->get('sellegance_carousel_autoplay') == 1) echo "autoPlay: 3000,"; ?>
				navigation: true,
				navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
				pagination: true,
				loop:true
			});
		});
	</script>

<?php } ?>