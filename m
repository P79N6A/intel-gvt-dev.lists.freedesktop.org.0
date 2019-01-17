Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1444947ywd;
        Wed, 16 Jan 2019 23:24:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6fv5t0ZfknNin1c71549v0nbMyG21s+GGNnO3hOZWDudqnuiYCGoJpVojNR3mJoRouHfBn
X-Received: by 2002:a65:4904:: with SMTP id p4mr12592640pgs.384.1547709845071;
        Wed, 16 Jan 2019 23:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547709845; cv=none;
        d=google.com; s=arc-20160816;
        b=I6qqsGimG8rrsVNUUW4ogTRDuffrFE0XBnaRfTQviCYdvpr/y636DulEaf/ct5Z5Zh
         rPGwjreHYjA+qWv1qhsqriJVQvKCUDsfoso/d4oyyz74FPH1dqNJhXWPIvFSmzoC09ia
         6kH1ZTRQu0aU4F46E13zhEpEU77S9IeDa6LrUrWXqHJ7zy358JGybXrQ52aXgqCNXGzg
         3wAz2ZJmH6XuRooNUfV+t96MlKVimTTiLFMn4RwKxvCVykPD5SFOEaXWgJSoyGsM55Qs
         TPLM1+DUjBvNWXyBEH4CSiort7/y0EzsiPBQj1maafBF1H2FNuGqNRpStzgwppADUznh
         Ldfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=BQo0B4N3Djyzyt7TIO/XLUMdII+f04x5w9ebTpbACS0=;
        b=u13AMZsdKIE3Fc5LrD8/CbY9hQLC5G/ZUJLNcq2VZ/mvnpHEzKmNVg9eO2vTYzXgcB
         Semmk+g2a3TDQd1vPkt3Za1OUCL50ryZimWJq00FZGa1kS9zjHBY00z5b9mzKmVG4Dfr
         D80nMGIzY0eJl4G+I3Vk1/i/S9bDUjJqPehzctHjL3KWT8qnyXb25muTcdjAiifwqGtw
         iwWGbwr1CUWQDGEgM+01fOfaKE24kNdswQllhQVgYhRiymLhTfdHm5HLfWBvIxMn3xHP
         cdCm88xA222WQabQ74JLeiWGXUdorchYdD5f44+5QK3NLMrIIZnQtgqeGdHrt2/lXBAr
         e6FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p17si908301pfk.275.2019.01.16.23.24.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 23:24:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4751E6F2EA;
	Thu, 17 Jan 2019 07:24:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512B6F2EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 17 Jan 2019 07:24:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 23:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,488,1539673200"; 
 d="asc'?scan'208";a="117375365"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2019 23:24:01 -0800
Date: Thu, 17 Jan 2019 15:12:32 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] drm/i915/gvt: Fix mmap range check
Message-ID: <20190117071232.GH18272@zhen-hp.sh.intel.com>
References: <20190111055853.1943-1-zhenyuw@linux.intel.com>
 <20190116133557.4158F20866@mail.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190116133557.4158F20866@mail.kernel.org>
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
Cc: "Orrala Contreras, Alfredo" <alfredo.orrala.contreras@intel.com>, "Monroy,
 Rodrigo Axel" <rodrigo.axel.monroy@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0791234677=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0791234677==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline


--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.16 13:35:56 +0000, Sasha Levin wrote:
> Hi,
>=20
> [This is an automated email]
>=20
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: 659643f7d814 drm/i915/gvt/kvmgt: add vfio/mdev support to =
KVMGT.
>=20
> The bot has tested the following trees: v4.20.2, v4.19.15, v4.14.93.
>=20
> v4.20.2: Build OK!
> v4.19.15: Build OK!
> v4.14.93: Build failed! Errors:
>     drivers/gpu/drm/i915/gvt/kvmgt.c:836:7: error: implicit declaration o=
f function ???intel_vgpu_in_aperture???; did you mean ???intel_vgpu_create?=
??? [-Werror=3Dimplicit-function-declaration]
>=20
>=20
> How should we proceed with this patch?
>

I'll prepare a backport version once this one hits linux master.

Thanks.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEAq4AAKCRCxBBozTXgY
J+amAJ9Mexp7Wpb6UicmatFi4UlrCcpBhgCfUkeCHkAnmiC/gSHunSwwNPT9hk8=
=ENse
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--

--===============0791234677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0791234677==--
