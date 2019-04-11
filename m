Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6428685ywo;
        Wed, 10 Apr 2019 20:09:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYYUe0jE3ZQPK0RgWpNcZk79Fen8vOWGVTjSsUuk6y4hoJ4kUbJSX1KCliqcmPmAYPsb5K
X-Received: by 2002:a63:3c19:: with SMTP id j25mr45155612pga.365.1554952165520;
        Wed, 10 Apr 2019 20:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554952165; cv=none;
        d=google.com; s=arc-20160816;
        b=Vtg0EkjJtMNZE5Nvvzxkbwz3BwmbAmNF2BEAY9wBAI4RJV6PGCyY/q1M6s3FZ9Ldf6
         OriVnUASIiCOQJSbA7s3b8QZkmoC9ZBkT/lJ50Zcsh9J6UBbQInuSZ0PGL9+ELpvCgR8
         ZbcAV8uvVO2Y6el8W0mkufz1HeQUINujbveo5uvxmCTrpJGxVCLAAvIjViBhnV7rXNt1
         eag8S51oOfx/3EgMg7nPIPBMYhHxciX3KyeVBLWtfwOPyigBHFeUCZR84sSG5uNhzwni
         as/jpj5Ga3LOuoqDgBgZkcfx2FooGWOg0jujlRzW9iVPpw4TVv91Q3PhxeBiw0e7Njp4
         7+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=nz4ir/qeKPjxnhxw1J042b1NHtWWn7W21cU2X+isUCk=;
        b=w3vWYAnNagUcGfpxmtt5EDMTGTJTMVC/eql179Nm76Us93c26H7T7QsHUwd6d2RbpS
         VL3balWH+Du4k9n48wXYMk7da0bRr6avur92HMG5h4pLqSW56fnzSvBewxtZz+LM7Tht
         UsHJGNH+gdzJCoN47y/hH/skaVyNaTwG4e9IHhbTMo8LZDG96PdnFgGyzZIWZT3AgTD9
         YB0QLMYBMjCNdCrWhODAFFLq8VVGf2eakYCAzNvSHcaxoUtSICjWFWssL27hPogCKs7A
         fUw7QyZ+KvMw/+FDQl13u70TKWKy8Wn0tQlSbVYM32Rl3UflEPBD+W8LzlEgCquOjyTA
         BByw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b17si26255721pls.15.2019.04.10.20.09.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 20:09:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064FF8980C;
	Thu, 11 Apr 2019 03:09:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775938980C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 03:09:22 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 20:09:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,335,1549958400"; 
 d="asc'?scan'208";a="141791781"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2019 20:09:20 -0700
Date: Thu, 11 Apr 2019 10:58:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Roundup fb->height into tile's height
 at calucation fb->size
Message-ID: <20190411025801.GZ17995@zhen-hp.sh.intel.com>
References: <1554869794-5196-1-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1554869794-5196-1-git-send-email-xiong.y.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0022387223=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0022387223==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gn1ylXQ+YRNuZICZ"
Content-Disposition: inline


--gn1ylXQ+YRNuZICZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.10 12:16:33 +0800, Xiong Zhang wrote:
> When fb is tiled and fb->height isn't the multiple of tile's height,
> the format fb->size =3D fb->stride * fb->height, will get a smaller size
> than the actual size. As the memory height of tiled fb should be multiple
> of tile's height.
>=20
> Fixes: 7f1a93b1f1d1("drm/i915/gvt: Correct the calculation of plane size")
>=20
> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks for the fix!

>  drivers/gpu/drm/i915/gvt/dmabuf.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index f6be971..4e1e425 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -209,7 +209,7 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct intel_vgpu_primary_plane_format p;
>  	struct intel_vgpu_cursor_plane_format c;
> -	int ret;
> +	int ret, tile_height =3D 1;
> =20
>  	if (plane_id =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		ret =3D intel_vgpu_decode_primary_plane(vgpu, &p);
> @@ -228,12 +228,15 @@ static int vgpu_get_plane_info(struct drm_device *d=
ev,
>  			break;
>  		case PLANE_CTL_TILED_X:
>  			info->drm_format_mod =3D I915_FORMAT_MOD_X_TILED;
> +			tile_height =3D 8;
>  			break;
>  		case PLANE_CTL_TILED_Y:
>  			info->drm_format_mod =3D I915_FORMAT_MOD_Y_TILED;
> +			tile_height =3D 32;
>  			break;
>  		case PLANE_CTL_TILED_YF:
>  			info->drm_format_mod =3D I915_FORMAT_MOD_Yf_TILED;
> +			tile_height =3D 32;
>  			break;
>  		default:
>  			gvt_vgpu_err("invalid tiling mode: %x\n", p.tiled);
> @@ -264,8 +267,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		return -EINVAL;
>  	}
> =20
> -	info->size =3D (info->stride * info->height + PAGE_SIZE - 1)
> -		      >> PAGE_SHIFT;
> +	info->size =3D (info->stride * roundup(info->height, tile_height)
> +		      + PAGE_SIZE - 1) >> PAGE_SHIFT;
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

--gn1ylXQ+YRNuZICZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXK6tOAAKCRCxBBozTXgY
J/A9AJ47+BG5Q+E2E3sKAfMh4rj7KodxTgCfdPwHvrv6dhpEfl3sLmkXW+qIEjI=
=gkAn
-----END PGP SIGNATURE-----

--gn1ylXQ+YRNuZICZ--

--===============0022387223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0022387223==--
