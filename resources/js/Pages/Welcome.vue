<script setup>
	import { Head, Link,useForm } from '@inertiajs/vue3'
	import {scroller} from 'vue-scrollto/src/scrollTo'
	import { ref, onMounted } from 'vue'
	import AdvertisementGalleryModal from '@/Components/AdvertisementGalleryModal.vue'
	const props = defineProps({
		featuredUnits: Array,
	});
	const message = useForm({
		subject:'',
		content:'',
		name:'',
		email:'',
		mobile:'',
	});
	const firstScrollTo = scroller();
	const onscroll = (el, listener) => {
		el.addEventListener('scroll', listener)
	}
	const toggleMobileMenuDropdown = ref(false);
	
	const scrollTo = (el) => {
		firstScrollTo(el);
		toggleMobileMenuDropdown.value = false;
	}
	const messageErrorDetails = ref('');
	const selectedFeatured = ref(null);
	const submitMessage = () => {
		message.post('/message/save', {
		  preserveScroll: true,
		  onSuccess: () => {
			message.reset();
			messageErrorDetails.value = '';
		  },
		  onError: (err) => {
			let errormessages = [];
			for(let i in err){
				errormessages.push(err[i]);
			}
			messageErrorDetails.value = errormessages.join(', ');
		  }
		});
	}

    onMounted(() => {
	  let selectHeader = document.getElementById('header')
	  if (selectHeader) {
	  let headerOffset = selectHeader.offsetTop
		let nextElement = selectHeader.nextElementSibling
		const headerFixed = () => {
		  if ((headerOffset - window.scrollY) <= 0) {
			selectHeader.classList.add('fixed-top')
			nextElement.classList.add('scrolled-offset')
		  } else {
			selectHeader.classList.remove('fixed-top')
			nextElement.classList.remove('scrolled-offset')
		  }
		}
		window.addEventListener('load', headerFixed)
		onscroll(document, headerFixed)
	  }
	  new PureCounter();
	})
  
</script>

<template>
    
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero home-hero p-0">
    <div class="container hero-container">
      <div class="row">
        <div class="col-md-12">
          <a class="hero-brand mb-0" href="/" title="MiLYANLEASE home"><img alt="MiLYANLEASE" src="assets/img/logo.png" class="m-0"></a>
        </div>
      </div>
	
		<div class="home-hero-content">
			<div class="mx-auto max-w-4xl px-4">
				<p class="home-hero-eyebrow">YOUR NEXT CHAPTER STARTS HERE</p>
				<h1 class="home-hero-title">Find a place that <span>feels like home.</span></h1>
				<p class="home-hero-subtitle">Discover thoughtfully managed homes and trusted guidance for every step of your move.</p>
				</div>
				
				<div class="home-hero-benefits mt-10 grid grid-cols-1 gap-3 px-3 sm:grid-cols-2 lg:grid-cols-4">
					<div class="p-1">
						<div class="home-benefit-card ls aab ads alm aqq bbo bbs bdj p-3">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="nz rw uj axz">
							  <path fill-rule="evenodd" d="M12.516 2.17a.75.75 0 00-1.032 0 11.209 11.209 0 01-7.877 3.08.75.75 0 00-.722.515A12.74 12.74 0 002.25 9.75c0 5.942 4.064 10.933 9.563 12.348a.749.749 0 00.374 0c5.499-1.415 9.563-6.406 9.563-12.348 0-1.39-.223-2.73-.635-3.985a.75.75 0 00-.722-.516l-.143.001c-2.996 0-5.717-1.17-7.734-3.08zm3.094 8.016a.75.75 0 10-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z" clip-rule="evenodd" />
							</svg>

							<div class="avt awl">
								<h3 class="awb bac">A trusted partner</h3>
								<p class="kw axj">Honest guidance, from first visit to move-in.</p>
							</div>
						</div>
					</div>
					<div class="p-1">
						<div class="home-benefit-card ls aab ads alm aqq bbo bbs bdj  p-3">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="nz rw uj axz">
								<path fill-rule="evenodd" d="M2 3.5A1.5 1.5 0 013.5 2h1.148a1.5 1.5 0 011.465 1.175l.716 3.223a1.5 1.5 0 01-1.052 1.767l-.933.267c-.41.117-.643.555-.48.95a11.542 11.542 0 006.254 6.254c.395.163.833-.07.95-.48l.267-.933a1.5 1.5 0 011.767-1.052l3.223.716A1.5 1.5 0 0118 15.352V16.5a1.5 1.5 0 01-1.5 1.5H15c-1.149 0-2.263-.15-3.326-.43A13.022 13.022 0 012.43 8.326 13.019 13.019 0 012 5V3.5z" clip-rule="evenodd"></path>
							</svg>
							<div class="avt awl">
								<h3 class="awb bac">Here when you need us</h3>
								<p class="kw axj">Friendly support and timely answers.</p>
							</div>
						</div>
					</div>
					<div class="p-1">
						<div class="home-benefit-card ls aab ads alm aqq bbo bbs bdj p-3">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" class="nz rw uj axz">
								<path fill-rule="evenodd" d="M2 3.5A1.5 1.5 0 013.5 2h9A1.5 1.5 0 0114 3.5v11.75A2.75 2.75 0 0016.75 18h-12A2.75 2.75 0 012 15.25V3.5zm3.75 7a.75.75 0 000 1.5h4.5a.75.75 0 000-1.5h-4.5zm0 3a.75.75 0 000 1.5h4.5a.75.75 0 000-1.5h-4.5zM5 5.75A.75.75 0 015.75 5h4.5a.75.75 0 01.75.75v2.5a.75.75 0 01-.75.75h-4.5A.75.75 0 015 8.25v-2.5z" clip-rule="evenodd"></path>
							</svg>
							<div class="avt awl">
								<h3 class="awb bac">Clear and simple</h3>
								<p class="kw axj">Straightforward details, with no surprises.</p>
							</div>
						</div>
					</div>
					<div class="p-1">
						<div class="home-benefit-card ls aab ads alm aqq bbo bbs bdj p-3">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="nz rw uj axz">
							  <path d="M7.493 18.75c-.425 0-.82-.236-.975-.632A7.48 7.48 0 016 15.375c0-1.75.599-3.358 1.602-4.634.151-.192.373-.309.6-.397.473-.183.89-.514 1.212-.924a9.042 9.042 0 012.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 00.322-1.672V3a.75.75 0 01.75-.75 2.25 2.25 0 012.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 01-2.649 7.521c-.388.482-.987.729-1.605.729H14.23c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 00-1.423-.23h-.777zM2.331 10.977a11.969 11.969 0 00-.831 4.398 12 12 0 00.52 3.507c.26.85 1.084 1.368 1.973 1.368H4.9c.445 0 .72-.498.523-.898a8.963 8.963 0 01-.924-3.977c0-1.708.476-3.305 1.302-4.666.245-.403-.028-.959-.5-.959H4.25c-.832 0-1.612.453-1.918 1.227z" />
							</svg>

							<div class="avt awl">
								<h3 class="awb bac">Made for you</h3>
								<p class="kw axj">The right place for the way you want to live.</p>
							</div>
						</div>
					</div>
				</div>
				<br />
				<a class="home-hero-cta scrollto" href="#features">Explore available homes <span aria-hidden="true">→</span></a>
		</div>
    </div>
  </section>
  <!-- End Hero -->

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center" style="background:#155e75;">
    <div class="container d-flex align-items-center">

      <div id="logo" class="me-auto">
        <a href="/"><img src="assets/img/logo.png" alt="MiLYANLEASE home"></a>
        <!-- Uncomment below if you prefer to use a text image -->
        <!--<h1><a href="#hero">MiLYANLEASE</a></h1>-->
      </div>

      <nav id="navbar" :class="'navbar order-last order-lg-0 '+(toggleMobileMenuDropdown?'navbar-mobile':'')">
        <ul>
          <li><a class="nav-link scrollto" @click="scrollTo('#about')">About</a></li>
          <li><a class="nav-link scrollto" @click="scrollTo('#features')">Features</a></li>
          <li><a class="nav-link scrollto" @click="scrollTo('#team')">Team</a></li>
          <li><a class="nav-link scrollto" @click="scrollTo('#contact')">Contact</a></li>
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

  <main id="main">

    <!-- ======= About Section ======= -->
    <section class="about" id="about">

      <div class="container text-center">
        <h2 style="font-size: 30px;margin-bottom: 65px;">
          ABOUT MiLYANLEASE
        </h2>

        <p style="text-align:justify;">
          MP started to move in in studio unit owned by his Significant Other  year 2020 with her New Born Baby Girl at Osmena East Building, despite of the pandemic, MP is pro-active. Because of those hypocrite, MP got an idea to use MP as her acronym.
		<br />
		<br />
		She also became the admin of official Market Place of The Residences At Commonwealth because of her amiable personality and was also known as one of the best seller  of quality fruits in the community. 
		<br />
		<br />

		Until one of Unit Owner  see a Great Potential and have a necessary abilities or qualities to become a successful Leasing Management.  MP successfully found her first tenant year 2020 with 1 (one) year tenancy-contract. Clients are very satisfied and happy with her services that that lovely and generous unit owner recommended her to other condo unit-owner/lessor. Now that she and her S.O having 2nd baby girl year 2022, and so as of now more than 100 condo units in her list. Take note that she only handled condo units who has a  kind and fair Lessors.
		<br />
		<br />

		MP is proud to say that she started with excited heart and good intention and it seemed destined for a career as a Real Estate Agent. 
		<br />
		<br />

		Being successful is something that ends up having the outcome we desired, and that is,  our peace of mind. 
		<br />
		<br />

		And, we, Mi-LEASE will help you find your new and peaceful home.
        </p>

        <div class="row stats-row">
          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span data-purecounter-start="0" data-purecounter-end="90" data-purecounter-duration="1" class="purecounter stats-no"></span>
              Satisfied Customers
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span data-purecounter-start="0" data-purecounter-end="98" data-purecounter-duration="1" class="purecounter stats-no"></span>
              Unit Leased
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" class="purecounter stats-no"></span>
              Hours Of Support
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span data-purecounter-start="0" data-purecounter-end="5" data-purecounter-duration="1" class="purecounter stats-no"></span>
              Hard Working Agents
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= Welcome Section ======= -->
    <section class="welcome text-center" style="background-repeat: repeat;">
      <h2 style="font-size: 30px;">Welcome to Mi-LEASE Management</h2>
      <p>
        Are you looking for a spacious and pet-friendly condo? Discover The Residences at Commonwealth by Century now!
      </p>
      <img alt="MiLYANLEASE property management" class="gadgets-img hidden-md-down" src="assets/img/gadgets.png" style="margin-top: -80px;">
    </section><!-- End Welcome Section -->

    <!-- ======= Features Section ======= -->
    <section class="portpolio" id="features" style="background:#edf6ff;">

      <div class="container">
        <h2 class="text-center" style="font-size: 30px;color: #199EB8; margin-bottom: 45px;">
          <b>Featured Units</b>
        </h2>
		<Link class="m-0 p-0 whitespace-nowrap text-md font-semibold text-sky-500 hover:text-sky-600 " style="float:right;" href="/ads">View All <span aria-hidden="true">→</span></Link>
		<br />
	  </div>
	  <div class="portfolio-grid" style="margin-top:0px;">
		<div class="row">
		  <div v-for="(featured,index) in featuredUnits" class="col-lg-3 col-sm-6 col-xs-12">
			<div class="card card-block" style="height: 300px; position: relative; cursor: pointer;" @click.prevent="selectedFeatured = featured">
			  <span v-if="featured.unit?.photos?.length > 1" style="position: absolute; top: 12px; right: 12px; background: rgba(0,0,0,0.65); color: #fff; border-radius: 4px; padding: 3px 8px; font-size: 12px; z-index: 10; pointer-events: none;">
				<svg aria-hidden="true" viewBox="0 0 24 24" style="display: inline-block; width: 14px; height: 14px; margin-right: 4px; vertical-align: -2px; fill: currentColor;">
				  <path d="M9 3 7.2 5H4a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-3.2L15 3H9Zm3 4a5 5 0 1 1 0 10 5 5 0 0 1 0-10Zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6Z"/>
				</svg>{{ featured.unit.photos.length }} Photos
			  </span>
			  <img alt="" :src="featured.unit?.main_photo?.path || '/assets/img/cover.jpg'" style="height: 300px; width: 100%; object-fit: cover;">
			  <div class="portfolio-over">
				<div>
				  <h3 class="card-title">{{ featured.title }}</h3>
				  <p class="card-text">{{ featured.unit?.summary ? featured.unit.summary.join(', ') : '' }}</p>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
    </section><!-- End Features Section -->
	<AdvertisementGalleryModal
		:open="Boolean(selectedFeatured)"
		:advertisement="selectedFeatured"
		@close="selectedFeatured = null"
	/>

    <!-- ======= Call to Action Section ======= -->
    <section class="cta">
      <div class="container">
		<div class="row">
          <div class="col-lg-9 col-sm-12 text-lg-start text-center">
            <h2 style="font-size: 30px;margin-bottom: 65px;">
              Schedule a site tripping today.
            </h2>

            <p>
              Found a home you love? Get in touch to schedule a viewing. Our team is ready to help you take the next step.
            </p>
          </div>

          <div class="col-lg-3 col-sm-12 text-lg-right text-center">
            <a class="btn btn-ghost" href="#contact">Contact Us</a>
          </div>
        </div>
      </div>
    </section><!-- End Call to Action Section -->

    

    <!-- ======= Team Section ======= -->
    <section class="team" id="team">
      <div class="container">
        <h2 class="text-center"  style="font-size: 30px;margin-bottom: 65px;">
          Meet our team
        </h2>

        <div class="row">
          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="assets/img/mila.jpg">
                <div class="card-title-wrap">
                  <span class="card-title">Mila Pasco</span> <span class="card-text">Chief Execetive Oficer</span>
                </div>

                <div class="team-over">
                  <h4 class="hidden-md-down">
                    Connect with me
                  </h4>

                  <nav class="social-nav">
                    <a href="#"><i class="bi bi-twitter"></i></a> <a href="#"><i class="bi bi-facebook"></i></a> <a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i class="bi bi-envelope-fill"></i></a>
                  </nav>

                  <p>
                    Leads the team and helps clients navigate their home search and leasing journey.
                  </p>
                </div>
              </a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="assets/img/fat.jpg">
                <div class="card-title-wrap">
                  <span class="card-title">Fatima Pasco</span> <span class="card-text">Executive Assistant</span>
                </div>

                <div class="team-over">
                  <h4 class="hidden-md-down">
                    Connect with me
                  </h4>

                  <nav class="social-nav">
                    <a href="#"><i class="bi bi-twitter"></i></a> <a href="#"><i class="bi bi-facebook"></i></a> <a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i class="bi bi-envelope-fill"></i></a>
                  </nav>

                  <p>
                    Supports daily operations and helps keep client requests moving smoothly.
                  </p>
                </div>
              </a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="assets/img/trisha.jpg">
                <div class="card-title-wrap">
                  <span class="card-title">Trisha Osian</span> <span class="card-text">Executive Secretary</span>
                </div>

                <div class="team-over">
                  <h4 class="hidden-md-down">
                    Connect with me
                  </h4>

                  <nav class="social-nav">
                    <a href="#"><i class="bi bi-twitter"></i></a> <a href="#"><i class="bi bi-facebook"></i></a> <a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i class="bi bi-envelope-fill"></i></a>
                  </nav>

                  <p>
                    Coordinates communications and provides administrative support to the team.
                  </p>
                </div>
              </a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="assets/img/dea.jpg">
                <div class="card-title-wrap">
                  <span class="card-title">Andrea Marcos</span> <span class="card-text">Document Officer</span>
                </div>

                <div class="team-over">
                  <h4 class="hidden-md-down">
                    Connect with me
                  </h4>

                  <nav class="social-nav">
                    <a href="#"><i class="bi bi-twitter"></i></a> <a href="#"><i class="bi bi-facebook"></i></a> <a href="#"><i class="bi bi-linkedin"></i></a> <a href="#"><i class="bi bi-envelope-fill"></i></a>
                  </nav>

                  <p>
                    Helps organize the documents needed throughout the leasing process.
                  </p>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <h2 class="section-title"  style="font-size: 30px;margin-bottom: 65px;">Contact Us</h2>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-lg-3 col-md-4">
            <div class="info">
              <div>
                <i class="bi bi-geo-alt"></i>
                <p>M3GP+JWJ, Amsterdam Avenue Brgy, Don Antonio Dr, Quezon City, 1109</p>
              </div>

              <div>
                <i class="bi bi-envelope"></i>
                <p>milyanlease@gmail.com</p>
              </div>

              <div>
                <i class="bi bi-phone"></i>
                <p>09175702021</p>
              </div>

            </div>
          </div>

          <div class="col-lg-5 col-md-8">
            <div class="form">
              <form role="form" class="php-email-form">
                <div class="form-group">
                  <input type="text" v-model="message.name" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="form-group mt-3">
                  <input type="email" v-model="message.email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
                <div class="form-group mt-3">
                  <input type="text"  v-model="message.subject" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control"  v-model="message.content" name="message" rows="5" placeholder="Message" required></textarea>
                </div>
                <div class="my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message" :style="'display:'+(messageErrorDetails?'block':'none')+';'">{{ messageErrorDetails }}</div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                </div>
                <div class="text-center"><button class="submit-message-button" @click.prevent="submitMessage">Send Message</button></div>
              </form>
            </div>
          </div>

        </div>
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer class="site-footer">
    <div class="bottom">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-xs-12 text-lg-start text-center">
            <p class="copyright-text">
              &copy; {{ new Date().getFullYear() }} <strong>MiLYANLEASE</strong>. All rights reserved.
            </p>
          </div>

          <div class="col-lg-6 col-xs-12 text-lg-right text-center">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="/">Home</a>
              </li>

              <li class="list-inline-item">
                <a href="#about">About Us</a>
              </li>

              <li class="list-inline-item">
                <a href="#features">Features</a>
              </li>

              <li class="list-inline-item">
                <a href="/ads">Available Units</a>
              </li>

              <li class="list-inline-item">
                <a href="#team">Team</a>
              </li>

              <li class="list-inline-item">
                <a href="#contact">Contact</a>
              </li>
            </ul>
          </div>

        </div>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  

</template>

<style>
.bg-dots-darker {
    background-image: url("data:image/svg+xml,%3Csvg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1.22676 0C1.91374 0 2.45351 0.539773 2.45351 1.22676C2.45351 1.91374 1.91374 2.45351 1.22676 2.45351C0.539773 2.45351 0 1.91374 0 1.22676C0 0.539773 0.539773 0 1.22676 0Z' fill='rgba(0,0,0,0.07)'/%3E%3C/svg%3E");
}
@media (prefers-color-scheme: dark) {
    .dark\:bg-dots-lighter {
        background-image: url("data:image/svg+xml,%3Csvg width='30' height='30' viewBox='0 0 30 30' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1.22676 0C1.91374 0 2.45351 0.539773 2.45351 1.22676C2.45351 1.91374 1.91374 2.45351 1.22676 2.45351C0.539773 2.45351 0 1.91374 0 1.22676C0 0.539773 0.539773 0 1.22676 0Z' fill='rgba(255,255,255,0.07)'/%3E%3C/svg%3E");
    }
}
.submit-message-button{
background: #199EB8;
    border: 0;
    padding: 10px 24px;
    color: #fff;
    transition: 0.4s;
}
.gslide-title{
	font-weight: bold !important;
}

.gs{
  margin-left: auto;
  margin-right: auto;
} 

.tv{
  max-width: 80rem;
} 

.arf{
  padding-left: 1.5rem;
  padding-right: 1.5rem;
} 

.ddc{
  padding-left: 2rem;
  padding-right: 2rem;
}

.kv{
  margin-top: 4rem;
}

.lw{
  display: grid;

}
.tq{
  max-width: 42rem;
}
.yb{
  grid-template-columns: repeat(1, minmax(0, 1fr));
}
.zm{
  gap: 1.5rem;
}
.bwx{
  margin-top: 5rem;
}
.ctb{
  margin-left: 0px;
  margin-right: 0px;
}
.cxh{
  max-width: none;
}
.cyn{
  grid-template-columns: repeat(3, minmax(0, 1fr));
}
.czl{
  gap: 2rem;
}
.ls{
  display: flex;
}
.aab{
	-moz-column-gap: 1rem;
    column-gap: 1rem;
}
.ads{
	border-radius: 0.75rem;
}
.alm{
	background-color: rgb(255 255 255 / 0.05);
}
.aqq{
	padding: 1.5rem;
}
.bbo{
	--tw-ring-offset-shadow: var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
  --tw-ring-shadow: var(--tw-ring-inset) 0 0 0 calc(1px + var(--tw-ring-offset-width)) var(--tw-ring-color);
  box-shadow: var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow, 0 0 #0000);
}

.bbs{
--tw-ring-inset: inset;
}
.bdj{
--tw-ring-color: rgb(255 255 255 / 0.1);
}

.avt{
  font-size: 1rem;
  line-height: 1.5rem;
}
.awl{
  line-height: 1.75rem;
}
.awb{
  font-weight: 600;
}
.bac{
  --tw-text-opacity: 1;
  color: rgb(255 255 255 / var(--tw-text-opacity));
}
.kw{
  margin-top: 0.5rem;
}
.axj{
  --tw-text-opacity: 1;
  color: rgb(209 213 219 / var(--tw-text-opacity));
}
.nz{
  height: 1.75rem;
}
.rw{
  width: 1.25rem;
}
.uj{
  flex: none;
}
.axz{
  --tw-text-opacity: 1;
  color: rgb(129 140 248 / var(--tw-text-opacity));
}

.hero.home-hero {
  display: flex;
  align-items: center;
  min-height: min(900px, 100vh);
  height: auto;
  padding: 52px 0 64px;
  overflow: hidden;
  background-image: url('/assets/img/cover.jpg');
  background-position: center 42%;
  background-size: cover;
}

.hero.home-hero::after {
  z-index: 0;
  background:
    linear-gradient(90deg, rgba(14, 42, 68, 0.72), rgba(17, 52, 80, 0.46) 55%, rgba(18, 47, 72, 0.3)),
    linear-gradient(0deg, rgba(9, 31, 54, 0.28), transparent 60%);
}

.hero.home-hero .hero-container {
  display: block;
  width: 100%;
  text-align: center;
}

.home-hero .hero-brand {
  margin-bottom: 20px;
}

.home-hero .hero-brand img {
  width: 210px;
  max-width: 60vw;
  filter: drop-shadow(0 8px 24px rgba(0, 0, 0, 0.28));
}

.home-hero-content {
  max-width: 1240px;
  margin: 0 auto;
}

.home-hero-eyebrow {
  margin: 0 0 16px;
  color: #bae6fd;
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.2em;
}

.home-hero-title {
  max-width: 950px;
  margin: 0 auto;
  color: #fff;
  font-size: clamp(2.2rem, 4vw, 3.5rem);
  font-weight: 750;
  letter-spacing: -0.045em;
  line-height: 1.04;
  text-shadow: 0 3px 22px rgba(0, 0, 0, 0.28);
}

.home-hero-title span {
  color: #a5e3ff;
}

.home-hero-subtitle {
  max-width: 650px;
  margin: 22px auto 0;
  color: rgba(255, 255, 255, 0.9);
  font-size: clamp(1rem, 2vw, 1.2rem);
  line-height: 1.7;
  text-shadow: 0 2px 14px rgba(0, 0, 0, 0.3);
}

.home-benefit-card {
  height: 100%;
  min-height: 128px;
  align-items: flex-start;
  padding: 20px !important;
  border: 1px solid rgba(255, 255, 255, 0.22);
  border-radius: 16px !important;
  background: rgba(255, 255, 255, 0.13) !important;
  text-align: left;
  backdrop-filter: blur(10px);
  box-shadow: 0 12px 34px rgba(7, 25, 44, 0.16);
}

.home-benefit-card h3 {
  color: #fff;
  font-size: 0.98rem;
  line-height: 1.4;
}

.home-benefit-card p {
  color: rgba(255, 255, 255, 0.8);
  font-size: 0.88rem;
  line-height: 1.55;
}

.home-hero-cta {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  margin-top: 32px;
  padding: 15px 23px;
  border: 1px solid rgba(255, 255, 255, 0.4);
  border-radius: 999px;
  background: #fff;
  color: #164e72;
  font-weight: 700;
  box-shadow: 0 12px 30px rgba(6, 24, 43, 0.24);
  transition: transform 160ms ease, background-color 160ms ease;
}

.home-hero-cta:hover {
  transform: translateY(-2px);
  background: #eaf7ff;
  color: #123d5b;
}

@media (max-width: 767px) {
  .hero.home-hero {
    min-height: auto;
    padding: 42px 0 54px;
    background-position: 58% center;
  }

  .hero.home-hero::after {
    background: linear-gradient(180deg, rgba(11, 37, 63, 0.72), rgba(12, 39, 64, 0.56));
  }

  .home-hero-benefits {
    margin-top: 28px;
  }

  .home-benefit-card {
    min-height: 0;
  }
}
</style>
