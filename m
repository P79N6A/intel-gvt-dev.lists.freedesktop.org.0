Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp6475614ywe;
        Wed, 6 Mar 2019 22:18:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHaczFjzt1VQo06rWmbnVIemAciv0Ny2bbGeK81Qp7A1fmu2pX/UhvX3V+mH1Wl5gsO4dL
X-Received: by 2002:a17:902:8bc6:: with SMTP id r6mr11364391plo.235.1551939499253;
        Wed, 06 Mar 2019 22:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551939499; cv=none;
        d=google.com; s=arc-20160816;
        b=k1wnBapAdn4r6eYYa5bRRMz+fsdtzBCPSyiyqfARwKVTQglspNezEiOPV0PSSoML+U
         +cpq3dpExfGLK2h8XtV46pkIiAXOp/YU8e9lDAtqyvVMDd1HPIAqem9NxLpGxS6HMoB0
         biK4w6gIvBvyL6AuSyQ7IZobilcJhEFHI7f48v1HsvvJWSeuFuu/LbuGnYuJLjSTfgfq
         eZbvuy6P31OvLOI1KaNmD3BPhpt1B0PnpFnukv+DZOe/cYTxTM262OWpP0PxDGYFCPaO
         E1+9g9bVe57KdZzkGETk2mb8NrT+P3Aa+fdi5pexGM0L3XKKFti8PS3Kr2YMmFggsGSO
         j2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=UTEy6ZUOGPy2loLjE3K1ROc0AH/Rah9JqBpJdU8Kpi8=;
        b=MBtmExWU0U/ekBt5UK7RU8WkkHPtjUIIUF278K2CgE736rLhY12MYjj+lWZL/7V2iR
         Vi7hGVwZblrqVuicPw4FAy5xRkjILgT049a6i1cYfI9hDXxDP+N3MNACIQZ3VGFKmzXo
         Ru2ppnnbLe/Vh/V9Q1ODaWb+wPuB/p3TjT5TqUeSDJ/i8y8Xzxvio1ti1M5u63gJDE+V
         tpOHSdBMObfR9+INBtxnQuFUc0vJC3aPxAM6DgkofVvkWHgaC0B/Ag1ipVjCBRGc+iuP
         y+Ztze5OhFUJOq3a0qEAu0eA13B/+jsSlnFXqvd2w3YmlPweQw6fHussTWAxuaySzYNV
         0Axw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id h131si3130261pgc.442.2019.03.06.22.18.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 22:18:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8DF6E24C;
	Thu,  7 Mar 2019 06:18:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AFE89D4B;
 Thu,  7 Mar 2019 06:18:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2019 22:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,450,1544515200"; 
 d="asc'?scan'208";a="280482405"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2019 22:18:14 -0800
Date: Thu, 7 Mar 2019 14:08:10 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes for 5.1-rc1
Message-ID: <20190307060810.GT12380@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1630373210=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1630373210==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bMdKf8OionWW5hC"
Content-Disposition: inline


--4bMdKf8OionWW5hC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-fixes for 5.1-rc1. This contains fixes for newer
version of Windows driver, e.g fix parser for MI_FLUSH_DW and
font render error. And with other stable fix in error path,
fix unexpected workload submission when vGPU idle, etc. Details
are below.

Thanks
--
The following changes since commit 0f75551216091223efe1f18295f655aff6415385:

  drm/i915/gvt: release shadow batch buffer and wa_ctx before destroy one w=
orkload (2019-01-23 13:58:46 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-03-07

for you to fetch changes up to 72aabfb862e40ee83c136c4f87877c207e6859b7:

  drm/i915/gvt: Add mutual lock for ppgtt mm LRU list (2019-03-04 14:45:28 =
+0800)

----------------------------------------------------------------
gvt-fixes-2019-03-07

- Fix MI_FLUSH_DW cmd parser on index check (Zhenyu)
- Fix Windows guest font render error (Colin)
- Fix unexpected workload submission for inactive vGPU (Weinan)
- Fix incorrect workload submission in error path (Zhenyu)
- Fix warning for shadow ppgtt mm reclaim list walk with locking (Zhenyu)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list

Weinan Li (1):
      drm/i915/gvt: stop scheduling workload when vgpu is inactive

Zhenyu Wang (4):
      drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index check
      drm/i915/gvt: Don't submit request for error workload dispatch
      drm/i915/gvt: Only assign ppgtt root at dispatch time
      drm/i915/gvt: Add mutual lock for ppgtt mm LRU list

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.c          | 14 +++++++++++++-
 drivers/gpu/drm/i915/gvt/gtt.h          |  1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c |  1 +
 drivers/gpu/drm/i915/gvt/scheduler.c    | 28 ++++++++++++++++++++--------
 5 files changed, 36 insertions(+), 10 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4bMdKf8OionWW5hC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIC1SQAKCRCxBBozTXgY
J+STAJ4uY3ukekGZat+y0Qm2yTNPAZuETQCfRXN8Q7JVm0DCPX/rJULaxQQuwWU=
=mqTW
-----END PGP SIGNATURE-----

--4bMdKf8OionWW5hC--

--===============1630373210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1630373210==--
