Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp400212ywb;
        Thu, 21 Mar 2019 01:04:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwD6xtE0U4NZlBbrfWBvFIHpGAVaEWXWrOpVnz47Ci27OvYeKHeduOLLcZAZjFwGwWkINJU
X-Received: by 2002:a17:902:d894:: with SMTP id b20mr2231509plz.318.1553155476586;
        Thu, 21 Mar 2019 01:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553155476; cv=none;
        d=google.com; s=arc-20160816;
        b=Uak9FW18fBAtCGDXhG3wWrTZgG62nkFdOcQ5Q8t3rcqsdZZs6szjs2JVtrvRIeb64V
         mDcu/oXUaqsWmpZhmpMPKjMLYZDjTJVda9uTpQblhfdHckF5MHRfHexfGm3LBFB9WtAA
         VediAHgGCKw3dZgeTcYxzn+xfOVpRyBQydwUMNJPfodEb5OoZ57smbVF/udBvTfmUWEw
         aDNRgjzbtEHndJCh+L2U6hRfH9OvxxZDnFPsipdOJ7FsPw5O2mtG/qTFyI908d0rVHK3
         gbqeWmK5Q0gGViuMHKt8IfEEG8C9Kf1ffNokaeSEGgm9Mwaz04NMr2r2lTbOEnqVH7u5
         2zNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=h92YigXm3qzj9T+D0cY6LxO73hIxm5WpRHoIzEFQyy0=;
        b=yFMHC8VyYclpvyzs+5iWC4F+RNwDbGUAts7PbLltVep3HcHU+spBKPcG2UOKXXfxqK
         L/Ex4FT4EzxB6a/ADNRk0bbvUCx1aRmjmvS65JIJ9Gl8CwzE3UfxM3FGS4XHzVUBXvzY
         1+E/HzY5rXhoadDF/sCXvxbCAX67qFFz72OMSdY4CTnIJCObUrlnYuWsIEWuS8qmtVQE
         Y/FzsLGUrp1rw98/BfOwBZFDH8Of8gj4t1W/wu+6pUnBEdjAM3LdM7yVCvlKlyvHGU3R
         AeCFhgHJ+9l1EIEuC/SzGC1vmwwCWW9vMwgscPmg7hgcQwnqgAtarrWubGe8qcJBIm0P
         wOrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f22si3620917pgv.578.2019.03.21.01.04.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 01:04:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269C389E03;
	Thu, 21 Mar 2019 08:04:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921A889E03
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Mar 2019 08:04:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 01:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,252,1549958400"; 
 d="asc'?scan'208";a="127321552"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 21 Mar 2019 01:04:32 -0700
Date: Thu, 21 Mar 2019 15:53:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Correct the calculation of plane size
Message-ID: <20190321075357.GH10798@zhen-hp.sh.intel.com>
References: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0070309756=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0070309756==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vRjLMflJ/YJvC+Q3"
Content-Disposition: inline


--vRjLMflJ/YJvC+Q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.03.19 10:28:44 +0800, Xiong Zhang wrote:
> stride isn't in unit of pixel, it is bytes, so calculation of
> plane size doesn't need to multiple bpp.
>

Fixes tag?

> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 3e7e2b8..5d887f7 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -238,9 +238,6 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		default:
>  			gvt_vgpu_err("invalid tiling mode: %x\n", p.tiled);
>  		}
> -
> -		info->size =3D (((p.stride * p.height * p.bpp) / 8) +
> -			      (PAGE_SIZE - 1)) >> PAGE_SHIFT;
>  	} else if (plane_id =3D=3D DRM_PLANE_TYPE_CURSOR) {
>  		ret =3D intel_vgpu_decode_cursor_plane(vgpu, &c);
>  		if (ret)
> @@ -262,14 +259,13 @@ static int vgpu_get_plane_info(struct drm_device *d=
ev,
>  			info->x_hot =3D UINT_MAX;
>  			info->y_hot =3D UINT_MAX;
>  		}
> -
> -		info->size =3D (((info->stride * c.height * c.bpp) / 8)
> -				+ (PAGE_SIZE - 1)) >> PAGE_SHIFT;
>  	} else {
>  		gvt_vgpu_err("invalid plane id:%d\n", plane_id);
>  		return -EINVAL;
>  	}
> =20
> +	info->size =3D (info->stride * info->height + PAGE_SIZE - 1)
> +		      >> PAGE_SHIFT;
>  	if (info->size =3D=3D 0) {
>  		gvt_vgpu_err("fb size is zero\n");
>  		return -EINVAL;
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--vRjLMflJ/YJvC+Q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJNDFQAKCRCxBBozTXgY
J9MuAJ9aKcGHRCWPyBEIcM2xZjpuoW6BgQCfXI5XPwcl/T2H9NcoAZBQioqJTYQ=
=NfI7
-----END PGP SIGNATURE-----

--vRjLMflJ/YJvC+Q3--

--===============0070309756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0070309756==--
