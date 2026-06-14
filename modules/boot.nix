{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.loader.timeout = 5;

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore;

  boot.kernelParams = [
    "loglevel=0"
    "console=tty2"
    "udev.log_level=0"
    "vt.global_cursor_default=0"
    "mitigations=off"
    "nowatchdog"
    "msr.allow_writes=on"
    "module.sig_unenforce"
    "intel_idle.max_cstate=1"
    "cryptomgr.notests"
    "initcall_debug"
    "intel_iommu=igfx_off"
    "no_timer_check"
    "noreplace-smp"
    "page_alloc.shuffle=1"
    "rcupdate.rcu_expedited=1"
    "tsc=reliable"
    "split_lock_mitigate=0"
    "nvidia-drm.modeset=1"
  ];
}
