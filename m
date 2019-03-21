Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp246313ywb;
        Wed, 20 Mar 2019 21:00:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEUbl74XiLTJRi+Wo44UoDZv+6OFViFQCdVWdHXY0pLRqqMlZTeSIhISAaajJwKju19VjC
X-Received: by 2002:a63:db07:: with SMTP id e7mr1330178pgg.231.1553140858965;
        Wed, 20 Mar 2019 21:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553140858; cv=none;
        d=google.com; s=arc-20160816;
        b=mBlvItLvvDK1Rcrcq+5AJUC577ohDjqUVPNAHm2Yu8Lhin32Jvc83F4ZpabtsOswB4
         jyOstz6G7uwbLaToOOcsB47vpAw1ky6XS6tOCtyEoPY4sAT+xMOCkN0/z0Xw8K417UYK
         Nq3wWz3oyCI0QnG0BamD/CVDE9OAZXNSt5G3mAQt449u9a+iXLHzSwbU5JBs5lrdbriT
         ObDs5g+Xn2EW8Kp8JwCz0WmMgAx9TrcNOgnxvek+KOom6Et5480xyzd/4OqPFJmeAyF0
         JX+b60MpbYn/moxNTFNkcXQIrYTHdgB05NFFNMJzGGvE36C3dLCvjv8TCKUBdwH1a4cU
         lPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=46VUljjz4GYUQaE3BZ0EYh+3S9u82/CXOcub20ia5dw=;
        b=spfHkTqTP2JPgE5R1dQnhvafm6AXxStg1IpS4ID8CeGLubDkf/qe/FeRAslG5e+LYm
         UvpugOFkEFVrGMVJy5GiPvhfLsDqnZpBebdNhDFde08l7g5gN94o5QVKNh68AcdB9nE6
         YC1cUMsY47Do01bqnteadVTSp4KBzAlXF0OdfNqfGQwJWQOYyJCAwHymEfuR4oX6w2bs
         DRCK0azdC2hwkIcTv6zeki6noRyRpO57o2kUSPEn+0H6qTeeZa1OdH1GzFRlvwJ/fbNT
         6Mox44uTJQ7S3k1YHyOx8JOdjRnAFDgRMseMqgHuGe1fgOt775OhNhZLsuuDMUv1v/X3
         YkHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f67si3250891pgc.182.2019.03.20.21.00.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 21:00:58 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFEA89D42;
	Thu, 21 Mar 2019 04:00:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFA789D2F;
 Thu, 21 Mar 2019 04:00:55 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2019 21:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,251,1549958400"; 
 d="asc'?scan'208";a="153691020"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2019 21:00:52 -0700
Date: Thu, 21 Mar 2019 11:50:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190321035018.GF10798@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2086231490=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2086231490==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p609JBPwWeYlfsbE"
Content-Disposition: inline


--p609JBPwWeYlfsbE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Sorry that I might miss 5.1-rc1 window as I was in full day event
during this week. Here's re-generated gvt-fixes against
drm-intel-fixes. This contains fixes for newer version of Windows
driver, e.g fixing parser for MI_FLUSH_DW command and fixed windows
font render error, with other stable fix in error path, and fix
unexpected workload submission when vGPU idle, etc. Details are below.

Thanks!
--
The following changes since commit 0f75551216091223efe1f18295f655aff6415385:

  drm/i915/gvt: release shadow batch buffer and wa_ctx before destroy one w=
orkload (2019-01-23 13:58:46 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-03-21

for you to fetch changes up to 72aabfb862e40ee83c136c4f87877c207e6859b7:

  drm/i915/gvt: Add mutual lock for ppgtt mm LRU list (2019-03-04 14:45:28 =
+0800)

----------------------------------------------------------------
gvt-fixes-2019-03-21

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

--p609JBPwWeYlfsbE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJMJ+gAKCRCxBBozTXgY
J6ovAJjeWXPQmYBbrff6xLV5KWMC8wALAJ41hYVrIEYJtR3cVwIjN60aEAkA0A==
=s9yK
-----END PGP SIGNATURE-----

--p609JBPwWeYlfsbE--

--===============2086231490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2086231490==--
