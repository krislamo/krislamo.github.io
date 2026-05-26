---
layout: single
title: "Why I'm building custom Vagrant boxes"
date: 2026-05-25
author_profile: true
---

_TL;DR: I've built custom Vagrant boxes for Debian 13 and Rocky Linux 10 using
Packer.
[Grab them from the registry](https://portal.cloud.hashicorp.com/vagrant/discover/krislamo.org)
or [take my configs to build them](https://git.krislamo.org/kris/pkrbuilds)
yourself._

When
[HashiCorp relicensed its free software](https://www.theregister.com/software/2023/08/11/hashicorp-changes-its-source-licence-to-bsl/1551785)
to the non-free BSL in 2023, the two projects that received significant
community-backed forks under the existing MPL terms were Terraform (OpenTofu)
and Vault (OpenBao), unsurprisingly given their weight in maintaining production
environments across the industry. That left less consequential HashiCorp
software, like Vagrant, without the momentum to keep it free, which I've used
for many years to design, test, and understand systems infrastructure.

Despite this, nearly three years later, you can still install the
[free version of Vagrant on Debian](https://packages.debian.org/trixie/vagrant)
because a maintainer continues to patch 2.3.7 to make it work (HashiCorp's
non-free version is on 2.4.9 at the time of writing). Vagrant is just a
convenience wrapper that automates the lifecycle of transient test virtual
machines, so the urgency to find another solution has been low, especially as
long as Debian continues to package it.

Following the Debian 13 release, Debian Vagrant box updates stalled for a while
after the
[maintainer decided to stop publishing images](https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg2049694.html)
due to Vagrant's non-free upstream status and breaking changes to HashiCorp's
image hosting platform. That led me to start building
[custom Debian 13 boxes](https://git.krislamo.org/kris/pkrbuilds/src/branch/main/debian-13)
with Packer.[^packer] One clear benefit of a custom box is baking in the NFS
client for host file sharing, so it's present from first boot, rather than
installed during the first `vagrant up`, as you'd have to on the current
official Debian image.

Lately, I've also been looking to run Rocky Linux boxes and ran into yet another
issue with official distro Vagrant boxes: the Rocky Linux registry links have
been [broken for months](https://git.resf.org/infrastructure/meta/issues/138),
making all official Rocky Linux boxes entirely unavailable. So now I'm building
and publishing both Debian 13 and
[Rocky Linux 10](https://git.krislamo.org/kris/pkrbuilds/src/branch/main/rocky-10)
Vagrant boxes for the libvirt provider.

Thankfully, Debian appears to have resumed updating its boxes more recently,
which is great, and likely the path most people should take for Debian. Still, a
deeper understanding of building custom boxes, greater control over updates, and
the additional flexibility of baking the NFS client have led me to continue
rolling my own. I publish them mostly for my own convenience, but since they're
public, feel free to use them or build them yourself if they're useful.

[^packer]:
    There's some irony in concern for a free Vagrant and then building images
    with Packer, as it's the same BSL relicense. But it's the obvious tool, in
    the same ecosystem, and made for exactly this. And like Vagrant, it's low
    stakes enough.
