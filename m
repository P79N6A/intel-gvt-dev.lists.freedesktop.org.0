Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1330730ywd;
        Wed, 9 Jan 2019 19:32:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6vVyZVWRptvSk/Q7gfPe24+WwKqiQD57bt1llK/11JLN4PBlNrxx0zS/XVMFGvub+yT5DX
X-Received: by 2002:a17:902:9a9:: with SMTP id 38mr8572230pln.204.1547091144655;
        Wed, 09 Jan 2019 19:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547091144; cv=none;
        d=google.com; s=arc-20160816;
        b=mHjqNF13kWi4AwNw2Jt5NHuGRQjpRBV1rZ/t3lZomkTFO+lA6b8s8CaODWEEGuPxS5
         quRp3VESD80/jkzlEdGx5RQW0+ME9xvu1Wvn7NzrHO2S5ZmbV7QYbSQnLRk+vZjphgdV
         sOgx88BYQiPvx/dCOA+37NH02V4G7zkRQANqQn+ohqzRR9Sb1p+kcq0+G37v1FDJTUAg
         UyesvHfnZbjoJnM+1Mgr8oEmBx6a8JHkq2WT6EzGkd0Dok+r5Meox3HwZXQkxPROVwCH
         Z/gpDqYfzuSTpFHkWuUAVcY71ddGvI0lS0S75BPyoRt+Uf1aEqKz5kfkxIMCtZ37smUy
         KD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=GgV3rSaZScH8JEotBAQmoy24NhFFUg77vvagK2f0e4E=;
        b=Nlk8REYOgwNyIuJdUaffG29MR2HwhkFMbKUlqbdrjXr3vgL90oDg8j/1a3Fw3ZVGSq
         Zme6yNgp5pNwaa44hrmeHDqenWozj5vjl5r0xV4YK7F20lBeYBknolJKoymIYVTyXaZw
         N/bzGSUgVpBa082R4Vi/qYoy+CzMbCG+Na6ezs/ZVLli7ll4eMX4jybYh0f71pLadcA8
         jtQYZzp+c1/J9vZP+rJqzVoWy3wJpIrC6uCaGf0Y3sPGnjq1y8F+eoxReiBvH+nta4Sd
         Nvv83++8+pJgVdIenudx1dPaYnEfDI39c+Rzbl4NFNku8MEAkOk5xj3ye0GQDxaTgaqE
         9gHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f5si7668918plo.422.2019.01.09.19.32.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jan 2019 19:32:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9153895C3;
	Thu, 10 Jan 2019 03:32:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789D895C3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 03:32:22 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2019 19:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,459,1539673200"; 
 d="asc'?scan'208";a="309139738"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2019 19:32:20 -0800
Date: Thu, 10 Jan 2019 11:21:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: fred gao <fred.gao@intel.com>
Subject: Re: [PATCH v2 1/6] drm/i915/gvt: Add coffeelake platform definition
Message-ID: <20190110032106.GP11631@zhen-hp.sh.intel.com>
References: <20190109011951.2132-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190109011951.2132-1-fred.gao@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Fei Jiang <fei.jiang@intel.com>
Content-Type: multipart/mixed; boundary="===============2110215151=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2110215151==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5cSRzy0VGBWAML+b"
Content-Disposition: inline


--5cSRzy0VGBWAML+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.01.09 09:19:51 +0800, fred gao wrote:
> Add D_ICL for CFL platform.
>=20
> Signed-off-by: Fei Jiang <fei.jiang@intel.com>
> Signed-off-by: fred gao <fred.gao@intel.com>
> ---

I think this serie is ready to merge.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

>  drivers/gpu/drm/i915/gvt/handlers.c |  2 ++
>  drivers/gpu/drm/i915/gvt/mmio.h     | 11 ++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index b5475c91e2ef..c1170f42b6a1 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -57,6 +57,8 @@ unsigned long intel_gvt_get_device_type(struct intel_gv=
t *gvt)
>  		return D_KBL;
>  	else if (IS_BROXTON(gvt->dev_priv))
>  		return D_BXT;
> +	else if (IS_COFFEELAKE(gvt->dev_priv))
> +		return D_CFL;
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/m=
mio.h
> index 1ffc69eba30e..5874f1cb4306 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.h
> +++ b/drivers/gpu/drm/i915/gvt/mmio.h
> @@ -43,15 +43,16 @@ struct intel_vgpu;
>  #define D_SKL	(1 << 1)
>  #define D_KBL	(1 << 2)
>  #define D_BXT	(1 << 3)
> +#define D_CFL	(1 << 4)
> =20
> -#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT)
> -#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT)
> +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> =20
> -#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT)
> -#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT)
> +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> =20
>  #define D_PRE_SKL	(D_BDW)
> -#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT)
> +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> =20
>  typedef int (*gvt_mmio_func)(struct intel_vgpu *, unsigned int, void *,
>  			     unsigned int);
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5cSRzy0VGBWAML+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDa6IgAKCRCxBBozTXgY
J9meAJ0Xe7gwaLyl7uZH96OhOr1EFqmrNwCaAmUwwEIBrEg+Huxz8MYK5qGKQYI=
=LTbD
-----END PGP SIGNATURE-----

--5cSRzy0VGBWAML+b--

--===============2110215151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============2110215151==--
