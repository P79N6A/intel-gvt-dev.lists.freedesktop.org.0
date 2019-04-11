Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6577420ywo;
        Thu, 11 Apr 2019 00:00:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwawwigyf36hnDnrAPJSMKdE0qikPxZqsmNpTShwO5TXLZOv5AGzr1z3ROburYS013G+XAM
X-Received: by 2002:a65:554e:: with SMTP id t14mr34637641pgr.107.1554966036397;
        Thu, 11 Apr 2019 00:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554966036; cv=none;
        d=google.com; s=arc-20160816;
        b=y1LH5XqNQ7U7UE+Wm0hhX8DCIw2Tb2a8I3alb84v9KMX3zNaR9bUnClcdo24WGMMKp
         Mrn6co/SZOIUVDGAN1phnYP2GbQ6irXbKYxBR35D8jNtb+Nfzff+yXmU2Mv/8DxHqL4I
         HY9ZmSM3JZJ2Q+l5jliyNZnRid2hIjaNjUzTMfLn2IpOkA7djQFG6AE13MKJ7t56GGLy
         HQi9rXV335QBc4zZRRxxq7z6SYByuNQHI0kUlFoBTRk4C7U4MiKf1a2GZkZhi5bmRd82
         9EE8Dgx6A72poPzFpQCG6JwAFhQEx3DyGTuvZ8H25DuJyIA2Dj38INUEbQIKmpJ2l9e0
         NJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=avWK3L/LAqizILFWP1G69I0BxGvYa9ZYM9nH6uGM+SM=;
        b=XBUFw+Qsp8AVQ0zpNRKEFK8Zst8VPXvuAq2e16ecf2LujT9Jgc06QplG5Iq/ba1tCs
         KruSg4pQAyxMjUAfh5MWY7HwrgavNBdMt17RyBiR/HknoMCTbxW9Mrb+nkE3a1APbjel
         ZO1uWB5F1OWYa+SqkyKeGLPVjKOzo7c0bCfw3b3m5asRmguGX+Oy9zurQAfw3dZpfhZ4
         DD9sbqyB2qhoGWfzuxlwUyJr0LIRxUmItRNqtUbbaFlwbVG2iGaxrsHBZ3B2KKnWCQpN
         IGkPAHCSSRDwpyJxwnB6Q/MnLSNcSQZF/V44yHRFXv1bwWQ1sxjTnHCs0T86Z9mkWAcB
         fx1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z7si32680281pgu.546.2019.04.11.00.00.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 00:00:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56429897F5;
	Thu, 11 Apr 2019 07:00:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B3897F5;
 Thu, 11 Apr 2019 07:00:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 00:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; 
 d="asc'?scan'208";a="141794160"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 11 Apr 2019 00:00:30 -0700
Date: Thu, 11 Apr 2019 14:49:10 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190411064910.GF17995@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2116605000=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2116605000==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XCIqNWEteo88hZlY"
Content-Disposition: inline


--XCIqNWEteo88hZlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

This includes one vGPU display plane size regression fix,
one for preventing use-after-free in ppgtt shadow free function
and another warning fix for iomem access annotation.

Thanks.
--
The following changes since commit cf9ed66671ec5f6cacc7b6efbad9d7c9e5e31776:

  drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug (2019-04-=
04 08:45:45 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-04-11

for you to fetch changes up to cd7879f79f83aec4bb13f0f823f323911dc5397b:

  drm/i915/gvt: Roundup fb->height into tile's height at calucation fb->siz=
e (2019-04-11 11:09:53 +0800)

----------------------------------------------------------------
gvt-fixes-2019-04-11

- Fix sparse warning on iomem usage (Chris)
- Prevent use-after-free for ppgtt shadow table free (Chris)
- Fix display plane size regression for tiled surface (Xiong)

----------------------------------------------------------------
Chris Wilson (2):
      drm/i915/gvt: Annotate iomem usage
      drm/i915/gvt: Prevent use-after-free in ppgtt_free_all_spt()

Xiong Zhang (1):
      drm/i915/gvt: Roundup fb->height into tile's height at calucation fb-=
>size

 drivers/gpu/drm/i915/gvt/dmabuf.c |  9 ++++++---
 drivers/gpu/drm/i915/gvt/gtt.c    | 12 +++++++++---
 drivers/gpu/drm/i915/gvt/kvmgt.c  |  6 +++---
 3 files changed, 18 insertions(+), 9 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--XCIqNWEteo88hZlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXK7jZgAKCRCxBBozTXgY
J9s2AKCb1MaF4YqfzmbRMeMmlUEtwVLjswCeOSy1JrgztsctSWTrN+wNPbtXkE0=
=2aqi
-----END PGP SIGNATURE-----

--XCIqNWEteo88hZlY--

--===============2116605000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2116605000==--
