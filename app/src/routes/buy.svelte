<script>
    import Button from "$lib/button/Button.svelte";

    let ticketType = 'seating';
</script>


<style>
    section#shop {
        display: flex;
        flex-direction: column;

        background-image: url(/bubble_top.svg), url(/bubble_center.svg), url(/bubble_bottom.svg);
        background-position: 0 88px, 0 184px, 0 372px;
        background-repeat: no-repeat, no-repeat, no-repeat;
    }

    #shop .title {
        align-self: center;
        line-height: 70px;
        font-weight: bold;
        font-size: 24px;
        color: #fff;
    }

    #selector {
        display: flex;
        flex-direction: column;
        gap: 15px;

        margin-block-end: 30px;
    }

    #features {
        align-self: center;

        width: 80vw;
        height: 500px;

        margin-block-start: 10px;

        background-color: #613574;
    }

    #pay {
        align-self: center;
    }
</style>


<section id="shop">
    <p class="title">Our Packages</p>
    <div>
        <h1 />
    </div>
    <div id="selector">
        <div id="type">
            <Button type="{ticketType === 'standing' ? 'full' : 'outline'}"
                    on:click={() => ticketType = "standing"}>Standing</Button>

            <Button type="{ticketType === 'seating' ? 'full' : 'outline'}"
                    on:click={() => ticketType = "seating"}>Seating</Button>

            <Button type="{ticketType === 'vip' ? 'full' : 'outline'}"
                    on:click={() => ticketType = "vip"}>VIP</Button>
        </div>
        <div id="features">

        </div>
        <div id="pay">
            <Button type="full">Pay</Button>
        </div>
    </div>
</section>
