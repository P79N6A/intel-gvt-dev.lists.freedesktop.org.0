Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1475230ywd;
        Wed, 23 Jan 2019 21:49:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4+6FHZlIlW/Z5yBOrno+u+rxb7qlKY6IfppRUE+VgfJGZztltDuGjVO9xtak4uIe/UIKPb
X-Received: by 2002:a63:6984:: with SMTP id e126mr4801600pgc.143.1548308970575;
        Wed, 23 Jan 2019 21:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548308970; cv=none;
        d=google.com; s=arc-20160816;
        b=msIcQ7dcCU9SYSZHQu/NDw13ZKAb/ILYTUK5l4LaFgrDTBr2UsUsAN29Wm+YXxNn7U
         GS0Gzu5XmKFuXfpAx6ZZ9DWCWYRf3C4crRyNoNOxYCapcgm1l4y42FRVm/6sWck8VAzz
         OwwpQJA0NW1atu4UxYIS8PA4yU+cEd7uLEYYgayLuk7wUBCtg0vpQUql3H7YjJE/3kai
         c2h10On9QoYVPa61Ex2EiTivsxWhhuBzAtRoqD74hBHeL/crOdVw640Wg5MDG3S4xAKm
         njKoyMi9MYTXvyMlZ+/nzxZlXIoJfkbDRIA+xi0QKvWHg8mWJYjOZs0iZeBwPipcIC7q
         k89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=27lO0nnnLpwesta5KPY8DW3YdQFjXTL5xjzX/UWZorI=;
        b=mwSu6axHdW0KCJpw2PmFtXK9wCSFGIAuAvSeyMoVdLfPsxynxLkxyOkjTDt18YKSK0
         6ZYV5FTO8t93Y6wkYfC804yz/R5fpUe11Mw5MV4Nyw2ZyC237eJj38P/p2KXBhdADMus
         Xu47AIpWKkzvuZoZAdc7+kMoQUe9p9msY1zcuRdFxs6QUvzxD6elPA+PHJDC5zp94zrh
         BBinKh+aHK4DYZ1MB8J2EccElJdAVX/XwxtABHOk76o4VbpBA0lTaLdL+D5QrjbLEA+V
         boEASC+VImCh0DTTTal85/FTnmcKcUGgAuiFEgH6hKfhORUy1e/2kE2ppjuwYJ9s3zpY
         L9pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z22si2338705pfd.197.2019.01.23.21.49.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jan 2019 21:49:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBFF6F099;
	Thu, 24 Jan 2019 05:49:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1D16E593;
 Thu, 24 Jan 2019 05:49:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 21:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,514,1539673200"; 
 d="asc'?scan'208";a="269449639"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 23 Jan 2019 21:49:24 -0800
Date: Thu, 24 Jan 2019 13:40:48 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-next
Message-ID: <20190124054048.GO7203@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1553578790=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1553578790==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3VRmKSg17yJg2MZg"
Content-Disposition: inline


--3VRmKSg17yJg2MZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here is gvt-next stuff. This includes Coffeelake support for GVT,
making kvmgt as self load module to have better dependence with
vfio/mdev, with some const treatment and kernel type change.

Thanks.
--
The following changes since commit d1810909d841314ba94b14dc3de9e9fbc13b046a:

  drm/i915/gvt: fix spelling mistake "Interupts" -> "Interrupts" (2018-12-0=
7 12:01:09 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2019-01-24

for you to fetch changes up to 2e679d48f38c378650db403b4ba2248adf0691b2:

  drm/i915/gvt: switch to kernel types (2019-01-23 13:56:14 +0800)

----------------------------------------------------------------
gvt-next-2019-01-24

- split kvmgt as seperate module (Zhenyu)
- Coffeelake GVT support (Fred)
- const treatment and change for kernel type (Jani)

----------------------------------------------------------------
Jani Nikula (4):
      drm/i915/gvt: remove drmP.h include
      drm/i915/gvt: give the cmd parser decode_info a const treatment
      drm/i915/gvt: give the cmd parser cmd_info a const treatment
      drm/i915/gvt: switch to kernel types

Zhenyu Wang (3):
      drm/i915/gvt: mandatory require hypervisor's host_init
      drm/i915/gvt: remove unused parameter for hypervisor's host_exit call
      drm/i915/gvt: Change KVMGT as self load module

fred gao (6):
      drm/i915/gvt: Add coffeelake platform definition
      drm/i915/gvt: Add mmio handler for CFL
      drm/i915/gvt: Enable gfx virtualiztion for CFL
      drm/i915/gvt: Reuse the gmbus pin macro
      drm/i915/gvt: Refine port select logic for CFL platform
      drm/i915: Enable gfx virtualization for Coffeelake platform

 drivers/gpu/drm/i915/Makefile           |   1 +
 drivers/gpu/drm/i915/gvt/Makefile       |   1 -
 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  83 ++++++++++++------------
 drivers/gpu/drm/i915/gvt/display.c      |  12 ++--
 drivers/gpu/drm/i915/gvt/dmabuf.c       |   5 +-
 drivers/gpu/drm/i915/gvt/edid.c         |  32 +++++++---
 drivers/gpu/drm/i915/gvt/fb_decoder.c   |  12 +---
 drivers/gpu/drm/i915/gvt/gvt.c          | 108 +++++++++++++---------------=
----
 drivers/gpu/drm/i915/gvt/gvt.h          |   6 +-
 drivers/gpu/drm/i915/gvt/handlers.c     |  29 ++++-----
 drivers/gpu/drm/i915/gvt/hypercall.h    |   9 ++-
 drivers/gpu/drm/i915/gvt/interrupt.c    |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c        |  42 ++++++++-----
 drivers/gpu/drm/i915/gvt/mmio.c         |   6 +-
 drivers/gpu/drm/i915/gvt/mmio.h         |  11 ++--
 drivers/gpu/drm/i915/gvt/mmio_context.c |  18 +++---
 drivers/gpu/drm/i915/gvt/mpt.h          |  13 ++--
 drivers/gpu/drm/i915/gvt/sched_policy.c |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c    |   7 +--
 drivers/gpu/drm/i915/gvt/scheduler.h    |   2 +-
 drivers/gpu/drm/i915/gvt/trace.h        |   2 +-
 drivers/gpu/drm/i915/intel_gvt.c        |  12 +---
 22 files changed, 204 insertions(+), 213 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--3VRmKSg17yJg2MZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXElP4AAKCRCxBBozTXgY
J697AJ0Xfek3LfIQFz98TA5wMx1YOket9gCfSscRtrgbKRfbv4V2gzF/Tw4ZKy0=
=gkno
-----END PGP SIGNATURE-----

--3VRmKSg17yJg2MZg--

--===============1553578790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1553578790==--
