Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1133705ywo;
        Thu, 4 Apr 2019 00:54:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxhIDeT1uwGdP5JH4tSqhgGf3SBJ/Z6ru3b06qVtUiKzD1wsjnUmnETbC3NoNksvaSGZ5j
X-Received: by 2002:a63:5b4d:: with SMTP id l13mr4225077pgm.160.1554364440104;
        Thu, 04 Apr 2019 00:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554364440; cv=none;
        d=google.com; s=arc-20160816;
        b=CELh6jFKzErRX7o6jIZV0l/pmBipyGx2Hjyifw9WNaVv0sfWyRwtI1EMRJgTVYpguu
         Q9vOTUwMkpH/YscS+y6aYOyxW4Qw+R3oUOXYgNnBCLhVmk6NqHhz0NMB90eY0VifHp3P
         GgWokGeoaGLS4s1fBUP/dcCUSV2MHWo5JnJ4lxzJS1Y0cUTgI6+21TOxSncOTseiTJWH
         f1MnmHhgIP3wh1Tt+rmRfjz9DdNWqFPtiW0vPtbFCztuUrrIy+yXsZInUXKTHBNcqPE/
         IcLNALuYCqogRKzfhnEpqjsXNRgHBF4l91DFrGSZ8I+8QbeyFWODAbdI192h7sc55OPc
         1s8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=kZwQQuN6oT4K6rB/xHtkqRD7kHVVsvmRE7J4n1XatAw=;
        b=mDFZQoECHMj6KM5B7w6rS3Td0Co9NY48R/BvKLqFhJiMHr9VRTrKVztRuzQQ2ZUUjm
         0qtVreJLCBz4LhCGZ578dHfzzTooyGpzY49yQ7lpyCNXrc4BGha0DG3fXZS3N0AfhAJb
         JsdttkcyjuNJwAs2DjGcLNzZ24E3F18IWpUgHaZY4oV7aSMqv+e6wm92f4+SFsg0FtkQ
         iwjh+phKOk5B23fjpYhpYbQxLa+Epq/CBXA7cbqYmPYhdA6nxtf7HZ+PU+TSIsdnuiJ6
         jYVSfrLlQX/0CUPbo75dt94RifmItuE+s2qsA4RJRwc74C5tlP0gGR+V3T6/B6Wk/Ub6
         SkCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 14si15885296pgv.248.2019.04.04.00.53.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 00:54:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224EF6E9D7;
	Thu,  4 Apr 2019 07:53:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55266E9CD;
 Thu,  4 Apr 2019 07:53:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 00:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="asc'?scan'208";a="131358163"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 04 Apr 2019 00:53:55 -0700
Date: Thu, 4 Apr 2019 15:42:50 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: Annotate iomem usage
Message-ID: <20190404074250.GR2322@zhen-hp.sh.intel.com>
References: <20190404071425.25847-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190404071425.25847-1-chris@chris-wilson.co.uk>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============2080964537=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2080964537==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ngPZezdD7QsvFaqQ"
Content-Disposition: inline


--ngPZezdD7QsvFaqQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.04 08:14:25 +0100, Chris Wilson wrote:
> Fix the sparse warning for blithely using iomem with normal memcpy:
>=20
> drivers/gpu/drm/i915/gvt/kvmgt.c:916:21: warning: incorrect type in assig=
nment (different address spaces)
> drivers/gpu/drm/i915/gvt/kvmgt.c:916:21:    expected void *aperture_va
> drivers/gpu/drm/i915/gvt/kvmgt.c:916:21:    got void [noderef] <asn:2> *
> drivers/gpu/drm/i915/gvt/kvmgt.c:927:26: warning: incorrect type in argum=
ent 1 (different address spaces)
> drivers/gpu/drm/i915/gvt/kvmgt.c:927:26:    expected void [noderef] <asn:=
2> *vaddr
> drivers/gpu/drm/i915/gvt/kvmgt.c:927:26:    got void *aperture_va
>=20
> Fixes: d480b28a41a6 ("drm/i915/gvt: Fix aperture read/write emulation whe=
n enable x-no-mmap=3Don")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Changbin Du <changbin.du@intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index d5fcc447d22f..a68addf95c23 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -905,7 +905,7 @@ static inline bool intel_vgpu_in_aperture(struct inte=
l_vgpu *vgpu, u64 off)
>  static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
>  		void *buf, unsigned long count, bool is_write)
>  {
> -	void *aperture_va;
> +	void __iomem *aperture_va;
> =20
>  	if (!intel_vgpu_in_aperture(vgpu, off) ||
>  	    !intel_vgpu_in_aperture(vgpu, off + count)) {
> @@ -920,9 +920,9 @@ static int intel_vgpu_aperture_rw(struct intel_vgpu *=
vgpu, u64 off,
>  		return -EIO;
> =20
>  	if (is_write)
> -		memcpy(aperture_va + offset_in_page(off), buf, count);
> +		memcpy_toio(aperture_va + offset_in_page(off), buf, count);
>  	else
> -		memcpy(buf, aperture_va + offset_in_page(off), count);
> +		memcpy_fromio(buf, aperture_va + offset_in_page(off), count);
> =20
>  	io_mapping_unmap(aperture_va);
> =20
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ngPZezdD7QsvFaqQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKW1egAKCRCxBBozTXgY
J8E+AJ9nEnXy/VIqZNNYBeO6Nb/7g8V6vwCfWJ3680ujrr2WSKEp5i1SkfigRPI=
=PIJ0
-----END PGP SIGNATURE-----

--ngPZezdD7QsvFaqQ--

--===============2080964537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2080964537==--
