Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1344021ywb;
        Thu, 28 Mar 2019 20:06:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8s+2gqxb3Q9z+B3BBa/RFZGzyAorBzO/yZ3umgSsSikCDmgkeJ5+wlbbdpmVN1KZB5qp/
X-Received: by 2002:a17:902:822:: with SMTP id 31mr2951552plk.290.1553828814542;
        Thu, 28 Mar 2019 20:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553828814; cv=none;
        d=google.com; s=arc-20160816;
        b=S98XDRkLGjm+JQiTcl1SUWkEWSEcb8qbY3LbQFxT/Fg16AxHmxKI7m+PjV4Huc3/tM
         niu+EoB11LyRwfdlhEggZ5lTKHm29aDsj8VWkqcu/Ieb79LEGYDaSsLIc3xx6YKwZ6m6
         xRCnLwp/0fjppqFQ8h+mHVhXSGHRTC3yuNhSn48GrEE/tRCu7BftUfS5KDTYG6NdjFh+
         kFPnaab4bfKdRU2/uMcMklBGd5K4SAWUMGYyc7UP/ykgx1uJvLOFhFpdoq0HpgQXAaIn
         EvSHXlWJ6O1wwD1DdVMImEEVBA3tyho1RQ1ke1FS1komHpkRDW6fJi816YlNKCyoDB/g
         xrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=XAdzCPAfiAu7zzoEIdV5jqAvS4n5PnJxfQghYwMUYBc=;
        b=vSZPlePIH3xpEe4Q/FjjvFzJ/E8cdezHsOOmnzIdUlHN7iI2/uhf6qeWxNulabIzjf
         MHPu+GuWwBV7apWip2jHVz0JqZwxzmRUj4I1E+qvkpMNbNKtKhJmOFKWyuat+8QGVUml
         k/SJu4aW+bDRTWoGtm/Ni9A8J2phzpz+2sK0MsWrqpJAwHBswP+DJP6GiW68WeD2y//J
         82S4jgDIYKRFqsIuxJopMBkBmkhD4Av2ruit2t2M6xJMun8yK+ptXMKTLkj/i5/ehoiv
         KP8G/CUpOX72UIhAo9dFKc8ZUBpIoNjLkX/crfx9q5KpaID3zQRLKj/WNvN5XTac8OLw
         89dA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id s79si821821pgs.245.2019.03.28.20.06.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 20:06:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FEF6E812;
	Fri, 29 Mar 2019 03:06:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCC86E812
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2019 03:06:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 20:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; 
 d="asc'?scan'208";a="126831304"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2019 20:06:50 -0700
Date: Fri, 29 Mar 2019 10:55:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2 0/3] Enable both asynchronous and synchronous plane flip
Message-ID: <20190329025559.GT10798@zhen-hp.sh.intel.com>
References: <20190325015217.24816-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190325015217.24816-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1506834436=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1506834436==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jw49tNX69S1hKGl0"
Content-Disposition: inline


--jw49tNX69S1hKGl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.25 09:52:14 +0800, Colin Xu wrote:
> Write to GEN graphics display register PLANE_SURF is considered a plane f=
lip,
> which can be done either through command streamer or MMIO write synchrono=
usly
> or asynchronously. Synchronous updates will update the plane surface valu=
es
> at the start of the next vertical blank to prevent screen tearing, while
> asynchronous updates will update the plane surface as soon as possible for
> faster screen update. The behaviour depends on MI_DISPLAY_FLIP command or
> plane control register.
>=20
> There also exist some mistakes on emulating pipe frame count and pipe flip
> count increment:
> - pipe frame count should only get incremented on every start of vsync, n=
ot
>   on plane flip.
> - pipe flip count indicates the start of flip when the plane surface
>   address is updated, not when the flip completes.
> - On GVT currently supported platforms including BDW and SKL+, pipe flip
>   count only count flips of primary plane.
> Relevant information can be found on Intel GFX PRM on 01.org.
>=20
> The patch set enables asynchronous plane flip for both MI_DISPLAY_FLIP
> update and plane surface address mmio update. With the patch, the render
> performance of some 3D application especially benchmark tools can be
> increased significantly.=20
> An experiment tested on gvt-staging (5.0.0-RC4):
> Host: Intel CFL NUC (i7-8559U, 16GB memory)
> Guest: 2 VCPU, 4096MB memory, Type-4 VGPU, dmabuf
> Benchmark: 3DMark IceStorm on Windows 10.0.17134
>=20
> +----------------+-----------+------------+
> |   Test Item    |  Before   |   After    |
> +----------------+-----------+------------+
> | Graphics score | 14346     | 55387      |
> | Graphic test 1 | 62.36 FPS | 252.65 FPS |
> | Graphic test 2 | 62.39 FPS | 230.04 FPS |
> | Physical score | 19688     | 26665      |
> | Physical test  | 62.50 FPS | 84.65 FPS  |
> +----------------+-----------+------------+
>=20
> v2:
> Add bit operation definition for flip mode. (zhenyu)
>=20
> Colin Xu (3):
>   drm/i915/gvt: Add macro define for mmio 0x50080 and gvt flip event
>   drm/i915/gvt: Enable synchronous flip on handling MI_DISPLAY_FLIP
>   drm/i915/gvt: Enable async flip on plane surface mmio writes
>=20
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 10 +++-
>  drivers/gpu/drm/i915/gvt/display.c    |  1 -
>  drivers/gpu/drm/i915/gvt/handlers.c   | 73 ++++++++++++++++++++-------
>  drivers/gpu/drm/i915/gvt/reg.h        | 31 ++++++++++++
>  4 files changed, 94 insertions(+), 21 deletions(-)
>=20

This series look fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--jw49tNX69S1hKGl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJ2JPgAKCRCxBBozTXgY
JxpZAJ4uS0GMdRldX+KRV9mmkTGOFg0D6ACeI1Z3dHD4ElkZbYqlcijMenf9Zqs=
=uNFg
-----END PGP SIGNATURE-----

--jw49tNX69S1hKGl0--

--===============1506834436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1506834436==--
