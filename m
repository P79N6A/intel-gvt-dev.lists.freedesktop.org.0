Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp399344ywb;
        Thu, 21 Mar 2019 01:03:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzucT9CQJtbL5Y3hdHOKO3cNtSKjQYGIuCDY8PDeO8xxDSWUNPBEglLycFL7Lhyi8R/fpSx
X-Received: by 2002:a65:41ca:: with SMTP id b10mr2181308pgq.146.1553155412962;
        Thu, 21 Mar 2019 01:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553155412; cv=none;
        d=google.com; s=arc-20160816;
        b=yNHg+ut5zKyoJD6tBgIOqKlh+hjAfYkMcSXo0rGgP3/vC4eWalEPzIDzQGMruugiPT
         +W5nZ9CUnNXaLQWxs7s3ZAdg7nRrMjLMMMIi0R+RxCJ3ErF3bDNgV9vkA5RQvb2NNr80
         1QQWRqHvV6ncgZ7y1IPPHFGLftc0TjrZPzkplQT5uXdVqu4qWCEQcl09YCnpsvr0nedN
         BsZUKqSd9rTQ+wllHqSxD05edeR0kMcBJI8GjFI1iHYvBDVLOBHXwnqxgQOqSTl5FuPk
         UdKLsbIfvkqlYSG2RqrcKhMHOMu0KBm91bFlIBKD0ysKtkKHB1tNp4h37tNll7OzmxVq
         e51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=D4sCBR/gJ2BgDNY+norT7Fs/G1rJeFgKexczA/lR0EI=;
        b=0Oc3w0EOdRg5TPmHXagPWmWsRZk2RJl1nou+dumqvgRuN1KiUBMQJoBA+WzMq4V85U
         4WLL5kcRKmfFoID6+MCIi7tfhvM6Bpik2c/gOPxs75SD/dYZZp5syh2z0RizOZxy8own
         5VnH3JcS7fC5EeD/gmVRfot7m5x50dlQP5nrmPAT09H7IPQuSUXwW3vaOIHAZqY2Qh9Q
         hb/girZjWyBN1fKCDFS49DBS7vg5QafQX3x3vzj3s9P9EBJU8Zylte+dYRmcLvI1iZU0
         4dZYzq04Oo8HlVrHmCiZHIlbiXeDAJuOnLU77cx56bPcZ1eXnARpxwmaSFV0r9mkRWo2
         kaKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 42si4055353pla.391.2019.03.21.01.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 01:03:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83BA89E06;
	Thu, 21 Mar 2019 08:03:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631E589E06
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Mar 2019 08:03:30 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 01:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,252,1549958400"; 
 d="asc'?scan'208";a="156968811"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2019 01:03:28 -0700
Date: Thu, 21 Mar 2019 15:52:54 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Change fb_info->size from pages to bytes
Message-ID: <20190321075254.GG10798@zhen-hp.sh.intel.com>
References: <1552962525-3786-1-git-send-email-xiong.y.zhang@intel.com>
 <1552962525-3786-2-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1552962525-3786-2-git-send-email-xiong.y.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0321302375=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0321302375==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0IhBwMLbrMClE+H"
Content-Disposition: inline


--E0IhBwMLbrMClE+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.19 10:28:45 +0800, Xiong Zhang wrote:
> fb_info->size is in pages, but some function need bytes when it
> is a parameter. Such as:
> a. intel_gvt_ggtt_validate_range() according to function definition
> b. vfio_device_gfx_plane_info->size according to the comment of
>    its definition
>=20
> This patch change fb_info->size into bytes.
>

I think we should keep plane's size in info->size instead of assigning
casted page size there, but just round up to page size when create dmabuf
object, then actual object size is kept in obj->size.

> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 5d887f7..90d2ef6 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -45,6 +45,7 @@ static int vgpu_gem_get_pages(
>  	int i, ret;
>  	gen8_pte_t __iomem *gtt_entries;
>  	struct intel_vgpu_fb_info *fb_info;
> +	u32 page_num;
> =20
>  	fb_info =3D (struct intel_vgpu_fb_info *)obj->gvt_info;
>  	if (WARN_ON(!fb_info))
> @@ -54,14 +55,15 @@ static int vgpu_gem_get_pages(
>  	if (unlikely(!st))
>  		return -ENOMEM;
> =20
> -	ret =3D sg_alloc_table(st, fb_info->size, GFP_KERNEL);
> +	page_num =3D fb_info->size >> PAGE_SHIFT;
> +	ret =3D sg_alloc_table(st, page_num, GFP_KERNEL);
>  	if (ret) {
>  		kfree(st);
>  		return ret;
>  	}
>  	gtt_entries =3D (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
>  		(fb_info->start >> PAGE_SHIFT);
> -	for_each_sg(st->sgl, sg, fb_info->size, i) {
> +	for_each_sg(st->sgl, sg, page_num, i) {
>  		sg->offset =3D 0;
>  		sg->length =3D PAGE_SIZE;
>  		sg_dma_address(sg) =3D
> @@ -157,8 +159,7 @@ static struct drm_i915_gem_object *vgpu_create_gem(st=
ruct drm_device *dev,
>  	if (obj =3D=3D NULL)
>  		return NULL;
> =20
> -	drm_gem_private_object_init(dev, &obj->base,
> -		info->size << PAGE_SHIFT);
> +	drm_gem_private_object_init(dev, &obj->base, info->size);
>  	i915_gem_object_init(obj, &intel_vgpu_gem_ops);
> =20
>  	obj->read_domains =3D I915_GEM_DOMAIN_GTT;
> @@ -210,6 +211,7 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  	struct intel_vgpu_primary_plane_format p;
>  	struct intel_vgpu_cursor_plane_format c;
>  	int ret;
> +	u32 page_num;
> =20
>  	if (plane_id =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		ret =3D intel_vgpu_decode_primary_plane(vgpu, &p);
> @@ -264,8 +266,10 @@ static int vgpu_get_plane_info(struct drm_device *de=
v,
>  		return -EINVAL;
>  	}
> =20
> -	info->size =3D (info->stride * info->height + PAGE_SIZE - 1)
> +	// align to page
> +	page_num =3D (info->stride * info->height + PAGE_SIZE - 1)
>  		      >> PAGE_SHIFT;
> +	info->size =3D page_num << PAGE_SHIFT;
>  	if (info->size =3D=3D 0) {
>  		gvt_vgpu_err("fb size is zero\n");
>  		return -EINVAL;
> @@ -275,7 +279,7 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		gvt_vgpu_err("Not aligned fb address:0x%llx\n", info->start);
>  		return -EFAULT;
>  	}
> -	if (((info->start >> PAGE_SHIFT) + info->size) >
> +	if (((info->start >> PAGE_SHIFT) + page_num) >
>  		ggtt_total_entries(&dev_priv->ggtt)) {
>  		gvt_vgpu_err("Invalid GTT offset or size\n");
>  		return -EFAULT;
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

--E0IhBwMLbrMClE+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJNC1gAKCRCxBBozTXgY
J1aZAJwLvgWwvvim+uQu0o8+fpX53IfefACePVFWlWXqo97oY17O5NQdAWIeGHk=
=gnsT
-----END PGP SIGNATURE-----

--E0IhBwMLbrMClE+H--

--===============0321302375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0321302375==--
