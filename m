Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1479675ywd;
        Wed, 23 Jan 2019 21:56:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5/jKWpqewUUi3thQGIriKfFBTP0jg6/X5vdBLs69xR2erzt6EFCw6Em1IhQGEwmUAuOUUe
X-Received: by 2002:a63:65c7:: with SMTP id z190mr4778294pgb.249.1548309402294;
        Wed, 23 Jan 2019 21:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548309402; cv=none;
        d=google.com; s=arc-20160816;
        b=utjbzzcAp0WonkpN+/X8DKLmpNA98u82vZ6Cv+LNpbZdystETaFI2xd0XmKxmq8Dbi
         My7CIR4Jhr7JmCAsKddhuIhUqy6/2SnjRiTGYcThMeF+cNqhAa7xJ+/T/ve5ljRWgJU2
         mBZ8U8O+KNmEPXxNuKRSccur1qHG0x4TW+y3on6yBfaCU0MDKPB3XjNvHbU+PSY8mq5X
         6GhP8azMAh581kvMa65tMxzKqLlm7FjWfsMPj4Lkk4A9/uMvo2weutc4t7tnqJ4kqKgP
         Pr+IBNjC/7NylRlEmKpCshfX1U91LUdoG0QPNeRaNRueG7ag2oZ1UP8PHzw5IHADC2MS
         QpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=7YgdhDNhqYIAUSMovwqJijCmdZWfG+OZ1ryNAxb50DI=;
        b=LUwxD6PBbl3GBfuSnevsFTrvT8WwfKwoMgAtJ47/UsuEsm4zd8SKLz5/ftlN2CLMk5
         +jvIlH0KGnNlexRcd7sDC77/rrnrQCbzQCQWh4R1tibdSm0Ks9RrGlk2bgTu+xmD2nNd
         xWgJNdZhCMp2m8rbX+/BUEjFYRoWzQVg92HLyFjv/q5h65qoc7En8dw8ejzqiJwgsSEs
         fj6OvDeHP3M/v4+xH3Lx/EFo6OpTCizjt/8q+lklIJZquv1G5kBZK7xK4dmI+SgPcBXL
         fbsclQ6D0h6RTfjZJ70XEqeYszqFM4rm6MAc09lpEPjJ98uuqUyT1eOwFUzbIo2cx4Pk
         s13g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r11si21202149plo.319.2019.01.23.21.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jan 2019 21:56:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722326F09A;
	Thu, 24 Jan 2019 05:56:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF1C6F098;
 Thu, 24 Jan 2019 05:56:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 21:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,514,1539673200"; 
 d="asc'?scan'208";a="293956915"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 23 Jan 2019 21:56:37 -0800
Date: Thu, 24 Jan 2019 13:48:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190124054801.GP7203@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0947357339=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0947357339==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="itqfrb9Qq3wY07cp"
Content-Disposition: inline


--itqfrb9Qq3wY07cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's one fix for gvt to destroy shadow batch and indirect context
properly.

Thanks.
--
The following changes since commit 51b00d8509dc69c98740da2ad07308b630d3eb7d:

  drm/i915/gvt: Fix mmap range check (2019-01-15 19:04:45 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-01-24

for you to fetch changes up to 0f75551216091223efe1f18295f655aff6415385:

  drm/i915/gvt: release shadow batch buffer and wa_ctx before destroy one w=
orkload (2019-01-23 13:58:46 +0800)

----------------------------------------------------------------
gvt-fixes-2019-01-24

- Fix destroy of shadow batch and indirect ctx (Weinan)

----------------------------------------------------------------
Weinan Li (1):
      drm/i915/gvt: release shadow batch buffer and wa_ctx before destroy o=
ne workload

 drivers/gpu/drm/i915/gvt/scheduler.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--itqfrb9Qq3wY07cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXElRkQAKCRCxBBozTXgY
J21/AJ4mDQhFEWjV9ZdC7hqqp066daZaegCfcKM+wc0GzWd5VdN4viUzWxUi1M8=
=26X9
-----END PGP SIGNATURE-----

--itqfrb9Qq3wY07cp--

--===============0947357339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0947357339==--
