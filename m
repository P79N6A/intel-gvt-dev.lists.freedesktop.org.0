Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp298392ywd;
        Tue, 22 Jan 2019 21:54:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN40m3yeQE+odzhr2ZpfKzmTLM7w399X0uKJCUPW7bg7yxJLZNMOwh/ZGVifmc34zdmwgMoN
X-Received: by 2002:a62:109b:: with SMTP id 27mr857945pfq.227.1548222857504;
        Tue, 22 Jan 2019 21:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548222857; cv=none;
        d=google.com; s=arc-20160816;
        b=nNc3m0QSqvimxgsTDsKu5kiWV8LPYSX1UvrE+oywJMt8fG6RjRp6FkSuEz+JkEpfPh
         qXjMe29/PGs0JONo3vbGlJzUrmFprXzWxMLRakuiRaNFTJMcqb6MTmw8XxOlgebL0Wfb
         7gC2xudIaLLHSvmJ5Q1nTs4KCqc+HV1xy7ZAKNwRGgY8hquacH9spsGiwOZ2T10ySWyi
         jHSoe4tGtV/topYZCt7K9phCe1Lcul7Igm8XOQSucyFavoAxEnXEspeulPrcCF07Lt45
         5bgCqiT+q+jGPNDI3Ed5z8JxPHOu3pNvd9/rS3/lF1oM0B0JkTw5DsudPC2T3oEboQdR
         CwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=FISkCri5JdEl1eNMgcBvydTutBOfJ9gnPgy2kQLtsP0=;
        b=RTBRscR6Z5aFwkO7kNJw1l5FTkE0Htry11+PpIfgr35YU+D6UjyUJ6BB/P6PGfSKq4
         f+Tg8zEB7gJKY9uEdBvf9bw9F2DY/h/cm+TGhzdAJCrsiuRZ/GlRsGEtROH3VsYJhs+Y
         HSjxfhNLnFiTJcei00X/vSL0JWeb54GTNgNRnkIfJELdPpxj8WTXeH9J4OAPI/oarFg2
         HRDjmZFmlzMEqXfg9B4/3S4+ydl4RH/gKx6DGBitrqeHBQtCcZfmVxhl7oWYGR86OKx4
         VuJm0gaGH4hcQ148fSmxLDFC6vR4xH+nMBzN3fWUzc3qK6l2kGl3KoRD6MTcncy2B+no
         CMlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b11si19137087pla.405.2019.01.22.21.54.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jan 2019 21:54:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF37D6E4A5;
	Wed, 23 Jan 2019 05:54:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975936E4A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Jan 2019 05:54:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 21:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,509,1539673200"; 
 d="asc'?scan'208";a="120571954"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 22 Jan 2019 21:54:13 -0800
Date: Wed, 23 Jan 2019 13:45:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Weinan Li <weinan.z.li@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: release shadow batch buffer and wa_ctx
 before destroy one workload
Message-ID: <20190123054540.GE7203@zhen-hp.sh.intel.com>
References: <1548135987-8894-1-git-send-email-weinan.z.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <1548135987-8894-1-git-send-email-weinan.z.li@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2091820629=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2091820629==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.22 13:46:27 +0800, Weinan Li wrote:
> GVT-g will shadow the privilege batch buffer and the indirect context
> during command scan, move the release process into
> intel_vgpu_destroy_workload() to ensure the resources are recycled
> properly.
>=20
> Fixes: 0cce2823ed37 ("drm/i915/gvt/kvmgt:Refine error handling for prepar=
e_execlist_workload")
>=20
> Signed-off-by: Weinan Li <weinan.z.li@intel.com>
> ---

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks for the fix!

>  drivers/gpu/drm/i915/gvt/scheduler.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 95f2547..1bb8f93 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -333,6 +333,9 @@ static void release_shadow_wa_ctx(struct intel_shadow=
_wa_ctx *wa_ctx)
> =20
>  	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
>  	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
> +
> +	wa_ctx->indirect_ctx.obj =3D NULL;
> +	wa_ctx->indirect_ctx.shadow_va =3D NULL;
>  }
> =20
>  static int set_context_ppgtt_from_shadow(struct intel_vgpu_workload *wor=
kload,
> @@ -912,11 +915,6 @@ static void complete_current_workload(struct intel_g=
vt *gvt, int ring_id)
> =20
>  	list_del_init(&workload->list);
> =20
> -	if (!workload->status) {
> -		release_shadow_batch_buffer(workload);
> -		release_shadow_wa_ctx(&workload->wa_ctx);
> -	}
> -
>  	if (workload->status || (vgpu->resetting_eng & ENGINE_MASK(ring_id))) {
>  		/* if workload->status is not successful means HW GPU
>  		 * has occurred GPU hang or something wrong with i915/GVT,
> @@ -1282,6 +1280,9 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_=
workload *workload)
>  {
>  	struct intel_vgpu_submission *s =3D &workload->vgpu->submission;
> =20
> +	release_shadow_batch_buffer(workload);
> +	release_shadow_wa_ctx(&workload->wa_ctx);
> +
>  	if (workload->shadow_mm)
>  		intel_vgpu_mm_put(workload->shadow_mm);
> =20
> --=20
> 1.9.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXEf/hAAKCRCxBBozTXgY
J+6JAJ9A0bvdC1C62DunF7imVN8w3aFKQQCXVF17aRBNPsuzHY7KiQflPerH7Q==
=tiIE
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

--===============2091820629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============2091820629==--
