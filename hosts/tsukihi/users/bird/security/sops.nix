{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  environment.systemPackages = builtins.attrValues {inherit (pkgs) age sops;};

  sops = {
    age = {
      sshKeyPaths = ["/var/lib/sops-nix/.ssh/bird"];
      # Instructions:
      # mkdir -p /var/lib/sops-nix/age
      # age-keygen -o /var/lib/sops-nix/age/keys.txt
      # Fill in your secrets in YAML format
      # sudo sops --encrypt  --in-place --age $(sudo age-keygen -y /var/lib/sops-nix/age/key.txt) ~/.finix/hosts/tsukihi/users/bird/secrets.yaml
      # sudo finix switch --flake .#tsukihi
      keyFile = "/var/lib/sops-nix/age/key.txt";
    };
    secrets = {
      userHashedPassword = {
        neededForUsers = true;
        sopsFile = ../secrets.yaml;
      };
      userGitName = {
        sopsFile = ../secrets.yaml;
      };
      userGitEmail = {
        sopsFile = ../secrets.yaml;
      };
      userPublicSshKey = {
        sopsFile = ../secrets.yaml;
      };
    };
    templates.git-user = {
      path = "/home/bird/.config/git/user.gitconfig";
      mode = "0644";
      owner = "bird";
      content = ''
        [user]
          name = ${config.sops.placeholder.userGitName}
          email = ${config.sops.placeholder.userGitEmail}
          signingkey = "/home/kokoro/.ssh/kokoro.pub"
      '';
    };
    templates.allowed-signers = {
      path = "/home/bird/.config/git/allowed-signers";
      mode = "0644";
      owner = "bird";
      content = ''
        ${config.sops.placeholder.userGitEmail} ${config.sops.placeholder.userPublicSshKey}
      '';
    };
  };
}
