Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1467573ywd;
        Wed, 16 Jan 2019 23:57:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4GVMXUrMmEBKdk0vjY0pEuOMRHj1nz/3/wSXMnubuD4oeCU5jhHKOgv/jjxlw549Ju3wXg
X-Received: by 2002:a17:902:6a8c:: with SMTP id n12mr14063617plk.85.1547711857079;
        Wed, 16 Jan 2019 23:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547711857; cv=none;
        d=google.com; s=arc-20160816;
        b=aONj6akppCPLs01Km4LokvmFvo53mzTt8dgl4gkmeuB+Gx33+k/jg2RdRKpg5o5FlZ
         qp16QHRiinIgowzqC5HGxigqvhTUySvpaGPktQgG3gHISC/id8yoIlBiOLePFqe4Pin6
         BRPjsaoK279Y8kOnnntnvsT7cAG2n3PAqQvbzhqCvrwxMsQ78FS5znTjKrYcgpsseE6e
         DWfJKtbi+mgVe0++yjXAMt+0MRjBu4dEUIsi2+OHfvgbOsJ83JN1ySJvcrS2Yem6Q1n/
         qz6ZxUslV7QVqhaP7xfky0eUNtx6asA1MJ8jG9pW5kfPS6r+LmsZYsDqHSSjltufqULg
         lkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=qtEfc2atW8rECRzaoHaLQaAwiuehuWAmPJs0pzwgVTs=;
        b=s8suFA/VxTX0s8lmAe0LnWLV/AF1QMlnKTvEDDi7z7zL3h4Jd+FBUJl4Jrnnn5yG5X
         V0Qgm9F2k6O+QDlGb3cyINSK01f3pFWf6AGUDz1kddAvL2WeQjGkn/ZBHIGNKAfVf/1j
         sTmeG3utHE95zV5E79ixFtHRHQboDOYfLjBPCdk/uNe4OkTnpkip4ilNV1vHHvs0C/eS
         eMN+W2K3rYDvo7HcDEw72nIL2xPJXGGD8vmW/Tc/FbnqU7oXjedNO7MRLNsb6H0c0Wpc
         4MF09IUS0snA/v81Z+AWJCDXrBsAy+828qZJWjIy+cIuVgashytlvEp2XhoMJNDLj0ss
         ML2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j7si1093797plb.91.2019.01.16.23.57.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 23:57:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AADD6F2EE;
	Thu, 17 Jan 2019 07:57:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D3E6E2A8;
 Thu, 17 Jan 2019 07:57:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 23:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,488,1539673200"; 
 d="asc'?scan'208";a="136510597"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jan 2019 23:57:33 -0800
Date: Thu, 17 Jan 2019 15:46:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes for 5.0-rc3
Message-ID: <20190117074604.GI18272@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1309400745=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1309400745==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

This contains one cmd parser failure fix to allow cmd access
for one register, and fix region cleanup properly in vGPU destroy,
and another fix for critical mmap size check mistake.

Thanks.
--
The following changes since commit f0e9943725186ddbdc9718a559c26c5f507262f2:

  drm/i915/gvt: Fix workload request allocation before request add (2019-01=
-09 12:59:09 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2018-01-17

for you to fetch changes up to 51b00d8509dc69c98740da2ad07308b630d3eb7d:

  drm/i915/gvt: Fix mmap range check (2019-01-15 19:04:45 +0800)

----------------------------------------------------------------
gvt-fixes-2018-01-17

- Fix one register cmd parser failure (Colin)
- Fix region cleanup for vGPU destroy (Henry)
- Fix mmap size check (Zhenyu)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Allow F_CMD_ACCESS on mmio 0x21f0

Hang Yuan (1):
      drm/i915/gvt: free VFIO region space in vgpu detach

Zhenyu Wang (1):
      drm/i915/gvt: Fix mmap range check

 drivers/gpu/drm/i915/gvt/handlers.c  |  1 +
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 30 ++++++++++++++++++++++++++----
 drivers/gpu/drm/i915/gvt/mpt.h       |  2 +-
 4 files changed, 29 insertions(+), 6 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEAyvAAKCRCxBBozTXgY
J4DiAJie2c5b5Any4499uoeT4tsIh7/uAJ47n4MSnJ/qTqzOsokDbfrwefTh8g==
=mvt6
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--

--===============1309400745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1309400745==--
