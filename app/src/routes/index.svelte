<script context="module">
	export const prerender = true;
</script>

<script>
	import { goto } from "$app/navigation";
	import Button from "$lib/button/Button.svelte";
</script>


<style>
	section#promo {
		height: 350px;
		position: relative;
		background: url(/wave.svg) no-repeat;
	}

	section#about {
		display: flex;
		flex-direction: column;
	}

	#about .title {
		align-self: center;
		line-height: 70px;
		font-weight: bold;
		font-size: 24px;
		color: #fff;
	}

	#greeting {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		gap: 15px;

		margin-inline: 20px;
		margin-block-start: 50px;
	}

	#teaser {
		display: flex;
		align-items: center;
		justify-content: center;

		align-self: start;

		width: 200px;
		height: 36px;

		margin: 0 20px;

		font-weight: bold;
		font-size: 14px;
		color: #fff;

		background-image: url("rounded.svg");
	}

	#actions {
		display: flex;
		gap: 10px;

		margin-block-start: 20px;
	}

	#title {
		line-height: 36px;
		font-weight: bold;
		font-size: 24px;
		color: #fff;

		margin: 0;
	}

	.Ellipse_36 {
		position: absolute;
		width: 40px;
		height: 40px;
		right: 50px;
		top: 35px;
	}

	#Ellipse_36 {
		opacity: 0.196;
		fill: transparent;
		stroke: #fff;
		stroke-width: 5px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}

	.Ellipse_45_vq {
		position: absolute;
		width: 18px;
		height: 18px;
		left: 14px;
		top: 185px;
	}

	#Ellipse_45_vq {
		fill: url(#Ellipse_45_vq);
	}

	.Ellipse_37 {
		position: absolute;
		width: 20px;
		height: 20px;
		left: 50px;
		top: 15px;
	}

	#Ellipse_37 {
		opacity: 0.2;
		fill: transparent;
		stroke: #fff;
		stroke-width: 3px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}

	.Ellipse_41 {
		position: absolute;
		width: 10px;
		height: 10px;
		left: 60px;
		top: 90px;
	}

	#Ellipse_41 {
		opacity: 0.2;
		fill: #fff;
	}

	.Ellipse_44 {
		position: absolute;
		width: 14px;
		height: 14px;
		right: 5px;
		top: 105px;
	}

	#Ellipse_44 {
		opacity: 0.2;
		fill: #fff;
	}

	.Ellipse_40 {
		position: absolute;
		width: 26px;
		height: 31px;
		left: 260px;
		top: 270px;
	}

	#Ellipse_40 {
		opacity: 0.2;
		fill: transparent;
		stroke: #fff;
		stroke-width: 3px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}

	.Path_1249, .Path_1250, .Path_1251 {
		position: absolute;
		width: 41px;
		height: 8px;
		transform: translate(80px, 1px) matrix(1,0,0,1,280,29) rotate(20deg);
		transform-origin: center;
		left: 0;
		top: 0;
	}

	#Path_1249, #Path_1250, #Path_1251 {
		opacity: 0.365;
		fill: transparent;
		stroke: rgba(97,53,116,1);
		stroke-width: 2px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}

	.Path_1249 {
		transform: translate(80px, 1px) matrix(1,0,0,1,270,39) rotate(20deg);
	}

	.Path_1251 {
		transform: translate(80px, 1px) matrix(1,0,0,1,275,34) rotate(20deg);
	}

	.Path_1246, .Path_1247, .Path_1248 {
		position: absolute;
		width: 56px;
		height: 11px;
		transform: translate(-1360.92px, -739.04px) matrix(1,0,0,1,1372.4722,766.7794) rotate(20deg);
		transform-origin: center;
		right: 10px;
		top: 260px;
	}

	.Path_1247 {
		right: 15px;
		top: 265px;
	}

	.Path_1248 {
		right: 20px;
		top: 270px;
	}

	#Path_1246, #Path_1247, #Path_1248 {
		opacity: 0.365;
		fill: transparent;
		stroke: rgba(97,53,116,1);
		stroke-width: 5px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}

	.Path_1252, .Path_1253, .Path_1254 {
		position: absolute;
		width: 57px;
		height: 11px;
		transform: translate(80px, -574px) matrix(1,0,0,1,-69.0995,603.1542) rotate(20deg);
		transform-origin: center;
		left: 10px;
		top: 210px;
	}

	.Path_1253 {
		left: 5px;
		top: 215px;
	}

	.Path_1254 {
		left: 0;
		top: 220px;
	}

	#Path_1252, #Path_1253, #Path_1254 {
		opacity: 0.15;
		fill: transparent;
		stroke: #fff;
		stroke-width: 5px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
</style>


<section id="promo">
	<div id="Hero_section">
		<div id="greeting">
			<p id="teaser">Let’s do the party</p>
			<p id="title">A concert you'll never forget</p>
			<div id="actions">
				<Button isActive="false" type="outline">Explore</Button>
				<Button on:click={() => goto('buy')}>Buy Ticket</Button>
			</div>
		</div>

		<div id="Graphic_vn" class="">
			<svg class="Ellipse_36">
				<ellipse id="Ellipse_36" rx="18" ry="18" cx="20" cy="20">
				</ellipse>
			</svg>
			<svg class="Ellipse_45_vq">
				<linearGradient id="Ellipse_45_vq" spreadMethod="pad" x1="1" x2="0" y1="0.5" y2="0.5">
					<stop offset="0" stop-color="#ed5492" stop-opacity="1"></stop>
					<stop offset="1" stop-color="#f6424b" stop-opacity="1"></stop>
				</linearGradient>
				<ellipse id="Ellipse_45_vq" rx="9" ry="9" cx="9" cy="9">
				</ellipse>
			</svg>
			<svg class="Ellipse_37">
				<ellipse id="Ellipse_37" rx="8" ry="8" cx="10" cy="10">
				</ellipse>
			</svg>
			<svg class="Ellipse_41">
				<ellipse id="Ellipse_41" rx="5" ry="5" cx="5" cy="5">
				</ellipse>
			</svg>
			<svg class="Ellipse_44">
				<ellipse id="Ellipse_44" rx="7" ry="7" cx="7" cy="7">
				</ellipse>
			</svg>
			<svg class="Ellipse_40">
				<ellipse id="Ellipse_40" rx="10" ry="10" cx="12" cy="12">
				</ellipse>
			</svg>
		</div>
		<svg class="Path_1250" viewBox="0 0 83.774 16.542">
			<path id="Path_1250" d="M -0.0001220703125 8.27093505859375 C -0.0001220703125 8.27093505859375 16.37060546875 -10.33868408203125 39.0869140625 8.27093505859375 C 61.8033447265625 26.88055419921875 83.7734375 8.27093505859375 83.7734375 8.27093505859375">
			</path>
		</svg>
		<svg class="Path_1251" viewBox="0 0 83.774 16.542">
			<path id="Path_1251" d="M -0.0001220703125 8.27093505859375 C -0.0001220703125 8.27093505859375 16.37060546875 -10.33868408203125 39.0869140625 8.27093505859375 C 61.8033447265625 26.88055419921875 83.7734375 8.27093505859375 83.7734375 8.27093505859375">
			</path>
		</svg>
		<svg class="Path_1246" viewBox="2119 587.633 168.062 33.185">
			<path id="Path_1246" d="M 2119 604.2261352539062 C 2119 604.2261352539062 2151.842041015625 566.8925170898438 2197.414306640625 604.2261352539062 C 2242.98681640625 641.5597534179688 2287.06201171875 604.2261352539062 2287.06201171875 604.2261352539062">
			</path>
		</svg>
		<svg class="Path_1247" viewBox="2119 587.633 168.062 33.185">
			<path id="Path_1247" d="M 2119 604.2261352539062 C 2119 604.2261352539062 2151.842041015625 566.8925170898438 2197.414306640625 604.2261352539062 C 2242.98681640625 641.5597534179688 2287.06201171875 604.2261352539062 2287.06201171875 604.2261352539062">
			</path>
		</svg>
		<svg class="Path_1248" viewBox="2119 587.633 168.062 33.185">
				<path id="Path_1248" d="M 2119 604.2261352539062 C 2119 604.2261352539062 2151.842041015625 566.8925170898438 2197.414306640625 604.2261352539062 C 2242.98681640625 641.5597534179688 2287.06201171875 604.2261352539062 2287.06201171875 604.2261352539062">
				</path>
			</svg>
		<svg class="Path_1249" viewBox="0 0 83.774 16.542">
			<path id="Path_1249" d="M -0.0001220703125 8.27093505859375 C -0.0001220703125 8.27093505859375 16.37060546875 -10.33868408203125 39.0869140625 8.27093505859375 C 61.8033447265625 26.88055419921875 83.7734375 8.27093505859375 83.7734375 8.27093505859375">
			</path>
		</svg>
		<svg class="Path_1253" viewBox="0 0 171.48 33.86">
			<path id="Path_1253" d="M 3.634748281911016e-06 16.93016242980957 C 3.634748281911016e-06 16.93016242980957 33.50996017456055 -21.16269302368164 80.00897216796875 16.93017959594727 C 126.5082473754883 55.02305603027344 171.4797668457031 16.93019866943359 171.4797668457031 16.93019866943359">
			</path>
		</svg>
		<svg class="Path_1254" viewBox="0 0 171.48 33.86">
			<path id="Path_1254" d="M 3.634748281911016e-06 16.93016242980957 C 3.634748281911016e-06 16.93016242980957 33.50996017456055 -21.16269302368164 80.00897216796875 16.93017959594727 C 126.5082473754883 55.02305603027344 171.4797668457031 16.93019866943359 171.4797668457031 16.93019866943359">
			</path>
		</svg>
		<svg class="Path_1252" viewBox="0 0 171.48 33.86">
			<path id="Path_1252" d="M 3.634748281911016e-06 16.93016242980957 C 3.634748281911016e-06 16.93016242980957 33.50996017456055 -21.16269302368164 80.00897216796875 16.93017959594727 C 126.5082473754883 55.02305603027344 171.4797668457031 16.93019866943359 171.4797668457031 16.93019866943359">
			</path>
		</svg>
	</div>
</section>

<section id="about">
	<p class="title">About the concert</p>
</section>


<svelte:head>
	<title>Home</title>
</svelte:head>
