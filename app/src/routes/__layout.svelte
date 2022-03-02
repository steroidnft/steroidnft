<script>
	import Header from '$lib/header/Header.svelte';
	import '../app.css';
</script>


<style>
	main {
		flex: 1;
		display: flex;
		flex-direction: column;
		width: 100%;
		max-width: 1024px;
		margin: 0 auto;
		box-sizing: border-box;
	}
</style>


<Header />

<main>
	<slot />
</main>
