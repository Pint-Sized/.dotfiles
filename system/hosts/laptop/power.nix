{
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MAX_PERF_ON_BAT = 50;
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";
      START_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 80;
      STOP_CHARGE_THRESH_BAT0 = 95;
      STOP_CHARGE_THRESH_BAT1 = 95;
      TLP_WARN_LEVEL = 3;
      WOL_DISABLE = "N";
    };
  };
}
