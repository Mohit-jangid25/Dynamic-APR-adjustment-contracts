module MyModule::DynamicAPR {
    use aptos_framework::signer;

    /// Struct storing the Annual Percentage Rate (APR).
    struct APR has store, key {
        rate: u64, // APR rate in basis points (e.g., 500 = 5.00%)
    }

    /// Function to initialize the APR with a default value.
    public fun initialize(owner: &signer, initial_rate: u64) {
        let apr = APR { rate: initial_rate };
        move_to(owner, apr);
    }

    /// Function to update the APR dynamically based on market conditions.
    public fun update_apr(owner: &signer, new_rate: u64) acquires APR {
        let apr = borrow_global_mut<APR>(signer::address_of(owner));
        apr.rate = new_rate;
    }
}