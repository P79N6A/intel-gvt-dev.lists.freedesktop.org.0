Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp4020811ywd;
        Tue, 15 Jan 2019 02:26:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4tjjU5YpleTw92I9ysNHpPKWVck6m9chnrFMTyafXhmOmDRzLvWUdLGWALF/3GoPgOGUYr
X-Received: by 2002:a62:16d6:: with SMTP id 205mr3253213pfw.256.1547548004681;
        Tue, 15 Jan 2019 02:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547548004; cv=none;
        d=google.com; s=arc-20160816;
        b=fJVKJPlaIZCzqLr9YJAWGzjsiipSZ/uM0eetxGdsjK2GggjLeRZKIo/PEXBCjmlAN7
         za+xvGMqh1h1Z/Ttwl9FHi3fmTTNp7IfYCrzBl1KSKQf3L0VodJHw3LgycO50VcbVn25
         uC7i64mk96WnNcV3JOClik9naVHNZfzBxvmzMR2ypoOhZaJ3Q/F6Ub9S/YtlhYigitJW
         8GLfQkxTSibFyunuORfeUw00LcU1QJUPrzV7zKkIP9hT8Y9mcE70YFGYW4rEojRJGVs5
         2xkMCnNG20MLrsEP7CG9HkFVzcR/Y8f1v3bxYSx23XEHUfJfso1MB4O1PwNMH7uIOky1
         rVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=a4tGeN240ziFC24k2O1M8p7LmiFzM26nOnQXEoRmQ64=;
        b=kUh31F/YwmA2hP2g5nVBYDIRCdStYoiyltHnP9+vWi7MshptwvBonXOLhfIeF1Nasr
         iWm9oTxMq7cVu1ObCNU7YuzF/Oc6GbLReWwJ9UnA1WtVAq4LUQC9BiM4jevjOkdjMtxh
         Wz/RLleAmmJp8IqTkUI2GAVQNH1eh+kFjWBVx/JlpWf/Td+ge62gaVS0DoNy5mrc+N+d
         ITMn1se1OleOxiKebY6L5RvEs9740jtErk47PgHi+Ves6/mMyRDIR+hewV8IECA8syeF
         b9006FKkQL2AQEQ6+7DTCUEJWoYfotuhzLo3Wlf2xyz6LVYjOW66lBndBpxnPQq3IIHu
         cNxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a34si3103493pgb.458.2019.01.15.02.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jan 2019 02:26:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1776EC68;
	Tue, 15 Jan 2019 10:26:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACB06EC68
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Jan 2019 10:26:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 02:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; 
 d="asc'?scan'208";a="126016156"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2019 02:26:41 -0800
Date: Tue, 15 Jan 2019 18:15:16 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH] drm/i915/gvt: free VFIO region space in vgpu detach
Message-ID: <20190115101516.GG11631@zhen-hp.sh.intel.com>
References: <1547462619-15700-1-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1547462619-15700-1-git-send-email-hang.yuan@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0259098844=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0259098844==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p609JBPwWeYlfsbE"
Content-Disposition: inline


--p609JBPwWeYlfsbE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.14 18:43:39 +0800, hang.yuan@linux.intel.com wrote:
> From: Hang Yuan <hang.yuan@linux.intel.com>
>=20
> VFIO region space is allocated when one region is registered for
> one vgpu. So free the space when destroy the vgpu.
>=20
> Also change the parameter of detach_vgpu callback to use vgpu directly.
>=20
> Fixes: b851adeac0858c7d257b3 ("drm/i915/gvt: Add opregion support")
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> ---

Looks fine to me, will pick up.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/gvt/mpt.h       |  2 +-
>  3 files changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index 5079886..831ab34 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -47,7 +47,7 @@ struct intel_gvt_mpt {
>  	int (*host_init)(struct device *dev, void *gvt, const void *ops);
>  	void (*host_exit)(struct device *dev);
>  	int (*attach_vgpu)(void *vgpu, unsigned long *handle);
> -	void (*detach_vgpu)(unsigned long handle);
> +	void (*detach_vgpu)(void *vgpu);
>  	int (*inject_msi)(unsigned long handle, u32 addr, u16 data);
>  	unsigned long (*from_virt_to_mfn)(void *p);
>  	int (*enable_page_track)(unsigned long handle, u64 gfn);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a19e684..b6bb650 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1671,9 +1671,21 @@ static int kvmgt_attach_vgpu(void *vgpu, unsigned =
long *handle)
>  	return 0;
>  }
> =20
> -static void kvmgt_detach_vgpu(unsigned long handle)
> +static void kvmgt_detach_vgpu(void *p_vgpu)
>  {
> -	/* nothing to do here */
> +	int i;
> +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> +
> +	if (!vgpu->vdev.region)
> +		return;
> +
> +	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> +		if (vgpu->vdev.region[i].ops->release)
> +			vgpu->vdev.region[i].ops->release(vgpu,
> +					&vgpu->vdev.region[i]);
> +	vgpu->vdev.num_regions =3D 0;
> +	kfree(vgpu->vdev.region);
> +	vgpu->vdev.region =3D NULL;
>  }
> =20
>  static int kvmgt_inject_msi(unsigned long handle, u32 addr, u16 data)
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mp=
t.h
> index 9b4225d..5b5995a 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -99,7 +99,7 @@ static inline void intel_gvt_hypervisor_detach_vgpu(str=
uct intel_vgpu *vgpu)
>  	if (!intel_gvt_host.mpt->detach_vgpu)
>  		return;
> =20
> -	intel_gvt_host.mpt->detach_vgpu(vgpu->handle);
> +	intel_gvt_host.mpt->detach_vgpu(vgpu);
>  }
> =20
>  #define MSI_CAP_CONTROL(offset) (offset + 2)
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

--p609JBPwWeYlfsbE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXD2ytAAKCRCxBBozTXgY
J7mdAKCaXUyB77x7cezeLuDibEGXIr0KWACfScE9n75cFIAEIC3jv3FcQIRsA6c=
=vylh
-----END PGP SIGNATURE-----

--p609JBPwWeYlfsbE--

--===============0259098844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0259098844==--
