Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2611557ywd;
        Sun, 13 Jan 2019 20:08:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6A90U73tn7ZB+hxmCkQB6L5yq6xxPOWxFtRxCUdVFRai6EGB62zvzQFw8EugZX23QQGXNn
X-Received: by 2002:a17:902:6a4:: with SMTP id 33mr23266821plh.99.1547438890576;
        Sun, 13 Jan 2019 20:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547438890; cv=none;
        d=google.com; s=arc-20160816;
        b=yJ2kTEGqOeGYEYRUYlbBUTM+CpWu2BPDZt0haUOIYKrG6WZZzGbuAUf8YrOOK1vjF1
         bHb6BcYQSuwb9S6A4ZPFdyRySTtHPrwPlKCor7mIw4vxkTwwd5BYTSxhgyBRSRB8pvde
         bE8Tz0isLTC9YkW0vMFbuyacyuqElHwxzHpsXGs44R45jVQetgh/g1LRIrUJSq4b67Qg
         LVG3QaKFy0Ym6W4dHi3krXz7Iu80/c0Bdaw60TG8frAE775gOptmzEd+ztwgkqktDeaG
         EZTy/6/sZuZdQB5zTHAiwGfqeiFEVvf96XXUCrsDhi5lTXJ49/GhX7EzYgTmQW0d/1/e
         hC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=3P+7bt4MJ4KdibBhUpkxXa+t29wJGFgnfdLb2qe61UM=;
        b=BUmXcHDULrBERjb4IMwQ93od+2c1eZE6GjqXRnVWQ5Q9lQfWSZhNZun3/X7/Ba+TPN
         VM/GZkHZYzIWNDlbcaU9p62zpvuHrWkZ6knxvUSL5gFgQHN1XWk+LvDE08TzU6/OhVNq
         XHIRvhf1P32jrpNVixQmZLxVlKcT2lU8QMZ6pDvbAMWU4lTZBfpYCRJIuBH2CFnP/gc0
         oIXEP5j4HwH2IcXGqC4K12jCtc/DJMnjduKQxasZUx/hd4cYAwSlX3R6xhs7jfg9YFwm
         O5pKxISBCMQGeBSMXAey6DkcTZDhrWcoxN9WmzXH2+r0lLTWT4MoG+n9yW+xYCGjqrYG
         X+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id k134si1657572pga.401.2019.01.13.20.08.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 20:08:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C90A6E5BC;
	Mon, 14 Jan 2019 04:08:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7F6E5BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 04:08:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 20:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; 
 d="asc'?scan'208";a="135552172"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2019 20:08:08 -0800
Date: Mon, 14 Jan 2019 11:56:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Message-ID: <20190114035645.GX11631@zhen-hp.sh.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0446048814=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0446048814==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jh06fhy6YTawvwPV"
Content-Disposition: inline


--jh06fhy6YTawvwPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.10 19:04:45 +0800, hang.yuan@linux.intel.com wrote:
> From: Hang Yuan <hang.yuan@linux.intel.com>
>=20
> Add one hypercall to free VFIO region memory. Also call it in vgpu
> destroy.
>=20
> Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 15 +++++++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       | 14 ++++++++++++++
>  drivers/gpu/drm/i915/gvt/vgpu.c      |  1 +
>  4 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index 5079886..2ab4138 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -67,6 +67,7 @@ struct intel_gvt_mpt {
>  	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
>  			     bool map);
>  	int (*set_opregion)(void *vgpu);
> +	void (*clean_regions)(void *vgpu);
>  	int (*get_vfio_device)(void *vgpu);
>  	void (*put_vfio_device)(void *vgpu);
>  	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);

> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a19e684..8c30dc3 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -493,6 +493,20 @@ static int kvmgt_set_opregion(void *p_vgpu)
>  	return ret;
>  }
> =20
> +static void kvmgt_clean_regions(void *p_vgpu)
> +{
> +	int i;
> +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> +
> +	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> +		if (vgpu->vdev.region[i].ops->release)
> +			vgpu->vdev.region[i].ops->release(vgpu,
> +					&vgpu->vdev.region[i]);
> +	vgpu->vdev.num_regions =3D 0;
> +	kfree(vgpu->vdev.region);
> +	vgpu->vdev.region =3D NULL;
> +}

It looks a little overkill to put this requiremnt on all hypervisor,
as VFIO region is KVMGT only thing, e.g might not be valid for other hyperv=
isor.
And looks our region.ops.release is never actually useful, what we need
is to free up vgpu regions, maybe just at detach vgpu time to let hypervisor
do any cleanup required.

> +
>  static void kvmgt_put_vfio_device(void *vgpu)
>  {
>  	if (WARN_ON(!((struct intel_vgpu *)vgpu)->vdev.vfio_device))
> @@ -1874,6 +1888,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
>  	.dma_map_guest_page =3D kvmgt_dma_map_guest_page,
>  	.dma_unmap_guest_page =3D kvmgt_dma_unmap_guest_page,
>  	.set_opregion =3D kvmgt_set_opregion,
> +	.clean_regions =3D kvmgt_clean_regions,
>  	.get_vfio_device =3D kvmgt_get_vfio_device,
>  	.put_vfio_device =3D kvmgt_put_vfio_device,
>  	.is_valid_gfn =3D kvmgt_is_valid_gfn,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mp=
t.h
> index 9b4225d..1a07994 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -314,6 +314,20 @@ static inline int intel_gvt_hypervisor_set_opregion(=
struct intel_vgpu *vgpu)
>  }
> =20
>  /**
> + * intel_gvt_hypervisor_clean_regions - Clean regions for guest
> + * @vgpu: a vGPU
> + *
> + */
> +static inline void intel_gvt_hypervisor_clean_regions(struct intel_vgpu =
*vgpu)
> +{
> +	if (!intel_gvt_host.mpt->clean_regions)
> +		return;
> +
> +	intel_gvt_host.mpt->clean_regions(vgpu);
> +}
> +
> +
> +/**
>   * intel_gvt_hypervisor_get_vfio_device - increase vfio device ref count
>   * @vgpu: a vGPU
>   *
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index e1c860f8..c5eb565 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -276,6 +276,7 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
> =20
>  	WARN(vgpu->active, "vGPU is still active!\n");
> =20
> +	intel_gvt_hypervisor_clean_regions(vgpu);
>  	intel_gvt_debugfs_remove_vgpu(vgpu);
>  	intel_vgpu_clean_sched_policy(vgpu);
>  	intel_vgpu_clean_submission(vgpu);
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

--jh06fhy6YTawvwPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDwIfQAKCRCxBBozTXgY
JygDAJ9tzDJ6q9Answ+3Iuf86TMwMvwjTgCgmDeIV7u6M2VkYRtbQxYl9zBOGQA=
=v9KR
-----END PGP SIGNATURE-----

--jh06fhy6YTawvwPV--

--===============0446048814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0446048814==--
