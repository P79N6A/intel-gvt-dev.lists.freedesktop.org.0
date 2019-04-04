Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp834998ywo;
        Wed, 3 Apr 2019 17:51:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNZDjdn09W1l9g0LXkX2GakvQr/IyrKHX932RXnQAALbZSROgJu4HrlLp8ni0pa/qZVgD9
X-Received: by 2002:aa7:8252:: with SMTP id e18mr2621704pfn.105.1554339065894;
        Wed, 03 Apr 2019 17:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554339065; cv=none;
        d=google.com; s=arc-20160816;
        b=S+9hFqmgzyP9LbCkc4xv/AbLDIPYYvDrOhrwWC2XXDa59aeVDChdZ8ziAaOZKMpDy+
         L44IvPcQZUoL2Zm1m2DYIVECf/MiWMFkv84rJA03y/E3N/t6HDrxltLwhP/9XclTyqRC
         LC4i1CsVf2/O+IGTs7BpC9d2bqZyGDEGXYIf+teYPOyjHr6a18eWoAeWoUoRnsXO8u/M
         /ibDivVnqzoCO9TXOGZquG84fYucdmF3oE9QcPWGWLNkgdoJQ7uv82Ak2jD3zTZf55Wb
         3G68/K8JXV08Gu1ElXOtTNpvjif3NasMh4UWphK+Z7OfNXYy/yCNPps5X8aFZnCNJDsd
         Kq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=+MIOZkC7wgDC98SfJwnJWXFiMuElk9O41lQders8Oag=;
        b=jDGBZqyVSy554VhGNP5r7dHvaMxw1k3xquECspd/GaYInFIrszd2w0cwNqBaFktTbt
         BaRu7OFM31ST8CzwlJmW1HAKNR1I0YpzR1BrLDFlH4WmBhAhxzLhj/MryFdn9F6OzoIb
         kVJAL/9k3dd9UgqQFkWA7BDDduk0GmBs+eEP9/NcAOY7WNz5QhWzex2rBwF0FLd4bHbD
         cIpcN0C3CvQqN3GS7wmL0JD6l/npGwARoillffEsb4tJiZrclErBgbh90idZkeG7Iwqb
         WEMz9xi6SVY9wkNShb8wvWq0wFmoKbUCBGDmijHWMuJ/6776M7p4iSSO0oCDH7+XDMyF
         LIBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f38si14419002pgf.90.2019.04.03.17.51.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 17:51:05 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAF76E552;
	Thu,  4 Apr 2019 00:51:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4F6E54D;
 Thu,  4 Apr 2019 00:51:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 17:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="asc'?scan'208";a="161199066"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2019 17:51:02 -0700
Date: Thu, 4 Apr 2019 08:39:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190404003957.GB8327@zhen-hp.sh.intel.com>
References: <20190402094037.GB2322@zhen-hp.sh.intel.com>
 <20190404001237.GA18158@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190404001237.GA18158@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1473460347=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1473460347==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.03 17:12:37 -0700, Rodrigo Vivi wrote:
> On Tue, Apr 02, 2019 at 05:40:37PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's gvt-fixes for 5.1-rc4 which includes misc fixes for
> > vGPU display plane size calculation, shadow mm pin count,
> > error recovery path for workload create and one kerneldoc
> > fix which I missed to include before.
>=20
> dim: 000d38970e98 ("drm/i915/gvt: Correct the calculation of plane size")=
: Fixes: SHA1 needs at least 12 digits:
> dim:     e546e281d33("drm/i915/gvt: Dmabuf support for GVT-g")
> dim: ERROR: issues in commits detected, aborting
>=20
> Is it something you could fix on your side without having
> to by-pass dim this time?
>=20

Please re-pull this one.

Thanks
--
The following changes since commit 26cdaac4793c49357d2c731f2190632cefb7efb1:

  drm/i915/icl: Fix VEBOX mismatch BUG_ON() (2019-03-28 15:36:40 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-04-04

for you to fetch changes up to cf9ed66671ec5f6cacc7b6efbad9d7c9e5e31776:

  drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug (2019-04-=
04 08:45:45 +0800)

----------------------------------------------------------------
gvt-fixes-2019-04-04

- Fix shadow mm pin count (Yan)
- Fix cmd parser error path recover (Yan)
- Fix vGPU display plane size calculation (Xiong)
- Fix kerneldoc (Chris)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug

Xiong Zhang (1):
      drm/i915/gvt: Correct the calculation of plane size

Yan Zhao (2):
      drm/i915/gvt: do not deliver a workload if its creation fails
      drm/i915/gvt: do not let pin count of shadow mm go negative

 drivers/gpu/drm/i915/gvt/display.c   | 2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 8 ++------
 drivers/gpu/drm/i915/gvt/gtt.c       | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c | 5 +++--
 4 files changed, 7 insertions(+), 10 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKVSXQAKCRCxBBozTXgY
Jw5OAJ9UzAsvpUGcHelLBdPRANfeZARRWwCeIpYEvCydRQGw+XsNvCyV2vrYn/Y=
=PeJG
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--

--===============1473460347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1473460347==--
