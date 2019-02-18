Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp1965703ywa;
        Mon, 18 Feb 2019 00:07:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY/vOvJxbEPTP69KEeFh0r02GnqdVY7YuEuL7CulfPShPGx1lLrEqF2wHiWNUTo5csifzpD
X-Received: by 2002:a17:902:4d46:: with SMTP id o6mr23265135plh.302.1550477233028;
        Mon, 18 Feb 2019 00:07:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550477233; cv=none;
        d=google.com; s=arc-20160816;
        b=euxniiCdbQXnQKKP+BprnwwvUmfxLS2F4gTMdCZ6oYxty/VOjWfwI3gwWuX4CmLWAl
         SKw0FOLgEY6so8hk9PJk+PxSFGzfH+3+OYPT+gIr3hHEhzT/SNXdK4f9EAiaVDHFUEo5
         P/Kund+7fL/28oFVeBGgn0H9/wTOVMfsUAKdF531AaXkRNmwtm10TLL0lv5uwu2UoGmf
         T6VHB5qt4Qdd+htliXJpYKyC6wmPim0kLkIxeoWa8Q/WI/S4V+gHRO0eqgTnGYdQ0tGe
         R2yqeBOwNAxZQ4zUqiOTz2sCeyZENvW5iTZNz6DOWAJBxxyLoF50g44hPhNTZMzkNg9e
         64mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=SGqWRvrP8qTZJcZ3Kd8CGULF20T4hmSd0J4RqhOxm4U=;
        b=OWKgpWzK8wKEXokqOFdsYD0Tg/QhLq9h4seI92TkqnoZVArFTFDJnx64LFK8buOcDE
         tZOuONW0Uh/R8scOrvjeMz0YZUxaOpC/Iim6OU/a2/SNPIUyolyfNJZB8n9Jm7eUYGQL
         iLa6NYjI2lexIr9DkDTHRl4cCHi+W9mdPBWd9T+ePv4aH0RzOxuQcJiM542La9vx/ITW
         te/2TYpLwkd2fahowsXIKTUt5Zk2atZV0CPieMJsn6XvbRoiPlvVI3LrvooEGttLUP87
         pNCpUHfk03DZtQa0B3l6aIkUfpMK09n78dW62v7j9eqSGGkkRXhdjDEiT6OSzLnMaiuA
         9JpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 16si12333600pgt.548.2019.02.18.00.07.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 00:07:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75189166;
	Mon, 18 Feb 2019 08:07:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D61489166
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 08:07:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 00:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,383,1544515200"; 
 d="asc'?scan'208";a="139476318"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 18 Feb 2019 00:07:10 -0800
Date: Mon, 18 Feb 2019 15:57:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhao Yakui <yakui.zhao@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Refine the combined
 intel_vgpu_oos_page struct to save memory
Message-ID: <20190218075741.GP12380@zhen-hp.sh.intel.com>
References: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
 <1550135357-30932-2-git-send-email-yakui.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1550135357-30932-2-git-send-email-yakui.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1949147985=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1949147985==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JPKYlvo4+BwO1+FT"
Content-Disposition: inline


--JPKYlvo4+BwO1+FT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.14 17:09:17 +0800, Zhao Yakui wrote:
> The intel_vgpu_oos_page uses the combined structure, which embdeds the
> tracked page. As it is allocated by kmalloc, the size(4140) is aligned
> to 8192. The 8192 oos_pages will waste about 32M memory.
> So the tracked page is split from the intel_vgpu_oos_page. And this will
> help to assure that the access of tracked page is cache aligned.
>=20
> Another minor change is that it doesn't need to be cleared to zero as
> it is writen firstly when one page is added to oos_page list.
>=20
> Signed-off-by: Zhao Yakui <yakui.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 7 +++++++
>  drivers/gpu/drm/i915/gvt/gtt.h | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index c7103dd..9ba1ed8 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2489,6 +2489,7 @@ static void clean_spt_oos(struct intel_gvt *gvt)
>  	list_for_each_safe(pos, n, &gtt->oos_page_free_list_head) {
>  		oos_page =3D container_of(pos, struct intel_vgpu_oos_page, list);
>  		list_del(&oos_page->list);
> +		free_page((unsigned long)oos_page->mem);
>  		kfree(oos_page);
>  	}
>  }
> @@ -2509,6 +2510,12 @@ static int setup_spt_oos(struct intel_gvt *gvt)
>  			ret =3D -ENOMEM;
>  			goto fail;
>  		}
> +		oos_page->mem =3D (void *)__get_free_pages(GFP_KERNEL, 0);
> +		if (!oos_page->mem) {
> +			ret =3D -ENOMEM;
> +			kfree(oos_page);
> +			goto fail;
> +		}
> =20
>  		INIT_LIST_HEAD(&oos_page->list);
>  		INIT_LIST_HEAD(&oos_page->vm_list);
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gt=
t.h
> index d8cb04c..e9f72a6 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.h
> +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> @@ -221,7 +221,7 @@ struct intel_vgpu_oos_page {
>  	struct list_head list;
>  	struct list_head vm_list;
>  	int id;
> -	unsigned char mem[I915_GTT_PAGE_SIZE];
> +	void *mem;
>  };
> =20
>  #define GTT_ENTRY_NUM_IN_ONE_PAGE 512
> --=20

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

btw, last time check I think we could skip oos page setup if out of sync
is not enabled at all, would you add that change too?

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--JPKYlvo4+BwO1+FT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXGpldQAKCRCxBBozTXgY
J4D1AJ0Y2McrF24vQfz3qvLLiXhfwQcsDwCfUMX6+0Ig9Eb2hzOnietIwUmYgJU=
=qU04
-----END PGP SIGNATURE-----

--JPKYlvo4+BwO1+FT--

--===============1949147985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1949147985==--
