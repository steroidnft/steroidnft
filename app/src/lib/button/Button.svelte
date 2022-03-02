<script>
    import { createEventDispatcher } from 'svelte';

    export let type = 'full';
    export let isActive = true;

    const dispatcher = createEventDispatcher();
</script>


<style>
    button {
        border: 0;

        color: #fff;
        background: transparent;
    }

    .full {
        background: url('./buttonbg.svg') no-repeat;
    }

    button, .full, .outline {
        width: 130px;
        height: 50px;
    }

    .outline {
        background: url('./buttonol.svg') no-repeat;
    }
</style>


<button class:full={type === 'full'} class:outline={type === 'outline'} disabled="{!isActive}"
        on:click={() => dispatcher('click')}><slot></slot></button>
