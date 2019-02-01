Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1783450ywd;
        Thu, 31 Jan 2019 22:24:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7NMf+ZeZu3Mx2mKT3crpmzAkWHB9A1i+UvvSFTPMy1CMTiSTX+ri2KkdeFzxd9eLbX0MNL
X-Received: by 2002:a62:34c6:: with SMTP id b189mr38928245pfa.229.1549002260529;
        Thu, 31 Jan 2019 22:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549002260; cv=none;
        d=google.com; s=arc-20160816;
        b=MGbs8Y7ZWrQ41X7SW2gFQ6jPeslF8B44l5r89NB5GIf8FeIP59RLE/nrhS6Naa1IKa
         HjstINTe5G0jdXLwu3oFgbbOVYv7JcwbsHAvBmshy/Ivv9agiA5R8Gsfrx3Jzpf9aJ1A
         0ZNg70JJIhOJjcarTLjrlmL4ltp9N+ylH3W8UFL3XzHb6DQ9qrfGnlyaAN7zB++2qj1n
         3INAZbTZl7DEk09PEboV0lolbmZpi0DtcnQVkZdOBIpWXkdY0Td0Sxu93pC4muzOjBcE
         3RCHPtKA5ycIGR8wfVihmxH2WmSwaGBIOi8gFS5Yt7eWcYJBWSXZc1z5gb+3UycbjehF
         MTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=O7T0e9+aMgo5cSgXIWUd/NzpWPxDTI65PPXNEsZniLs=;
        b=ENtdGr09wWTszFjM7F0wMC+x8XeT0KZKVXbvIiP2IHdkt8li82mkwIZrtEcmpUJ+3g
         nOqL9+jlQAyCI8ipTAR+jreRGiq18RAiVt6Yio1l/sXTIRPA8bWl5jampKa3Ja3KDCRO
         obaZMpnXMwhy2Vd9xvzQvFYgnBwLCKFsW4kETIWEvtszcK+O0x2hLZoERabpurmI9VvH
         6O6nW4qUE9gM+MnJD0vJ///dvSdDfEtD0F7t7NRzIEl9S7E+NYSocBWLzKhRUdBmSK4l
         P/PeRrAlvm53AvZs1GK812bQeEwFROUaMq514OsEk0p6gsNioYDeNn+RkKMlw/evUp7y
         YKGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y17si6727045pll.10.2019.01.31.22.24.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Jan 2019 22:24:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FE96EDB6;
	Fri,  1 Feb 2019 06:24:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA936EDB6;
 Fri,  1 Feb 2019 06:24:18 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2019 22:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,547,1539673200"; 
 d="asc'?scan'208";a="140676920"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2019 22:24:16 -0800
Date: Fri, 1 Feb 2019 14:15:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-next
Message-ID: <20190201061523.GE5588@zhen-hp.sh.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0979655995=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0979655995==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

This should be last gvt-next pull for this round, which adds VFIO edid
region support in GVT, VM manager can use this to specify custom EDID
for VM, which can be used for e.g UI resize, etc.

p.s, Next week will be chinese new year, so team will be offline then.

Thanks.
--
The following changes since commit 2e679d48f38c378650db403b4ba2248adf0691b2:

  drm/i915/gvt: switch to kernel types (2019-01-23 13:56:14 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2019-02-01

for you to fetch changes up to 39c68e87bc50a71bcfe93582d9b0673ef30db418:

  drm/i915/gvt: add VFIO EDID region (2019-01-31 11:41:25 +0800)

----------------------------------------------------------------
gvt-next-2019-02-01

- new VFIO EDID region support (Henry)

----------------------------------------------------------------
Hang Yuan (3):
      drm/i915/gvt: add functions to get default resolution
      drm/i915/gvt: add hotplug emulation
      drm/i915/gvt: add VFIO EDID region

 drivers/gpu/drm/i915/gvt/display.c   |  31 ++++++++
 drivers/gpu/drm/i915/gvt/display.h   |  37 +++++++--
 drivers/gpu/drm/i915/gvt/gvt.c       |   1 +
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 +
 drivers/gpu/drm/i915/gvt/hypercall.h |   1 +
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 143 +++++++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/i915/gvt/mpt.h       |  17 +++++
 drivers/gpu/drm/i915/gvt/vgpu.c      |   6 ++
 8 files changed, 233 insertions(+), 6 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXFPj+wAKCRCxBBozTXgY
J2nFAJ9TVUR7rOUW5mDiNbTORb5CRgcpHwCfavhBh5Fssjid9n1b8MsTjW/AsOk=
=qaIL
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--

--===============0979655995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0979655995==--
