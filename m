Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp829566ywo;
        Wed, 3 Apr 2019 17:43:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0uCXwY38ZWFmLoYqA0kImb6LZf29L/tmiD/lJKsFFtjDRtwtUFQIkO+CcTn9Ew7N7Mt2T
X-Received: by 2002:a63:c34a:: with SMTP id e10mr2650898pgd.194.1554338595166;
        Wed, 03 Apr 2019 17:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554338595; cv=none;
        d=google.com; s=arc-20160816;
        b=m87namWHlvseUBOkRPFmqshr0L4FuPk7b6tZh3Y0Gij3GcwFhmFwXCJGw0jSVEGpNR
         TO4JBBI6ddFg2C4trFpiCMHMTiU9R5vK5HQFwadl4Xhlz1RtAr4o4r0IzaPhRdpxE+cf
         XFWzUWWMPyIEmJs0tRgtcdUjHozH9sK5g8bUG5v7sppYXvRqchwqS8YidRhra+kGiR9l
         QhH5rtGWOyWRhwri6xJAWPOHhigwtAVba0o0Iu5GS/tW6ifa2/Rjq8Exib2sMZdoywtG
         u10BZdLDLnem4Y15JXOZJhqEXRYtnKvLbicg2Tt3z6ShLuxxFhUQjKN3BxVfyzVcJxRd
         QgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=3+qdPFVOAbHIaJmnjQ/nbhwhJKEqWYQaruCWoPRn25c=;
        b=sXbGCeLs7M8aJiH+dMXFNI/o5rpXpEbcEZmkHDao19WxgUELPkskJi60gadMW7toKf
         Pi5xf/202pri5aM8hECdwYpRSqa0ENL9j4/Be5DV+bBHjja5nP6wEc3Dhjeh/91iEQrE
         gtbZlGuRrzFYEpYoz7J1n2LSo7IZ885e+0/KiHY0nxyF2Iz1DlSUsvvrub7ojX4OxQFn
         da3F6/W/IkgO7OcF9u1N1mZkypIaJ05/eatMTeU0DuTZ1N8JaToat20htBBDrCNuMG2d
         CGm0vUkEXXGDszd7r8Uc5fF5NkTOhbEhA8BQjzs5ZdwzyX5uSSZdHSmUAo2jtFmZK/Hh
         RkLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k193si15105138pga.319.2019.04.03.17.43.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 17:43:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAF96E54D;
	Thu,  4 Apr 2019 00:43:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C7E6E54D;
 Thu,  4 Apr 2019 00:43:13 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 17:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="asc'?scan'208";a="220359455"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 17:43:11 -0700
Date: Thu, 4 Apr 2019 08:32:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190404003206.GA8327@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1525589718=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1525589718==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline


--W/nzBZO5zC0uMSeA
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

Sorry about that, looks people still doesn't generate Fixes tag
properly. I'll fix that and resend.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKVQhgAKCRCxBBozTXgY
J8TxAJ9MPXcQlSHhxVZwHAT34KFGqPHaRwCghABNO6k4RlWjMES/tjxf4SAMmRY=
=sMjs
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--

--===============1525589718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1525589718==--
