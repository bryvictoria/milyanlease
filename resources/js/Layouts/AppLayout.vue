<script setup>
	import { ref } from 'vue';
	import { Head, Link, router } from '@inertiajs/vue3';

	defineProps({
		title: String,
	});

	const logout = () => {
		router.post(route('logout'));
	};
</script>

<template>
    <div>
	
		<!-- ======= Header ======= -->
		<header id="header" class="d-flex align-items-center" style="background:#1f2b47;">
			<div class="container d-flex align-items-center">

			  <div id="logo" class="me-auto">
				<a href="index.html"><img src="assets/img/logo.png" alt=""></a>
				<!-- Uncomment below if you prefer to use a text image -->
				<!--<h1><a href="#hero">Bell</a></h1>-->
			  </div>

			  <nav id="navbar" :class="'navbar order-last order-lg-0 '+(toggleMobileMenuDropdown?'navbar-mobile':'')">
				<ul>
				  <li><Link class="nav-link scrollto" href="/#about">About</Link></li>
				  <li><Link class="nav-link scrollto" href="/#features">Features</Link></li>
				  <li><Link class="nav-link scrollto" href="/#team">Team</Link></li>
				  <li><Link class="nav-link scrollto" href="/#contact">Contact</Link></li>
				  <li><Link class="nav-link" href="/login">Login </Link></li>
				</ul>
				
				<i :class="'bi bi-'+(toggleMobileMenuDropdown?'x':'list')+' mobile-nav-toggle'" @click="toggleMobileMenuDropdown = !toggleMobileMenuDropdown"></i>
			  </nav>

			  <div class="header-social-links d-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
				<a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
				<a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
				<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
			  </div>
			</div>
		</header><!-- End Header -->

		<main>
			<slot />
		</main>
        
    </div>
</template>
