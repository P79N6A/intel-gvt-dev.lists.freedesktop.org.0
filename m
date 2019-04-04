Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1137410ywo;
        Thu, 4 Apr 2019 00:59:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkoT7rqATFkLaEcaB/A1FC16zaZ5hVnr9syCxWSnp6OXjW1BMTB36TO6mP0wO4xeMKDfcj
X-Received: by 2002:a62:a515:: with SMTP id v21mr4369795pfm.41.1554364784295;
        Thu, 04 Apr 2019 00:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554364784; cv=none;
        d=google.com; s=arc-20160816;
        b=A+S8jEfcOVhSV9k9lATJDMF7ZwU4aBZ/2zNDPm+XOepjImnamX26Ac4391HVTe0vhE
         k2fp1o0faMcRYc8WP1tj3MrSOzLy6m4hLtH31p9llnJGAKMkWBrKp1ur/fXtkONMlw8t
         AWLKX5wvqnwJ+OVQDcZZ0gJNa2wzyUWCL+X0xtkzFfirXyQ10OyXwAGx6F7qBUORW9oQ
         KrdJshHA7jRjv3797TizMKy57jKlr4n7ynxt6EQK4V+Xjez4D+fEiUdze124quRmlDfz
         GZ/q7DN7GuDHM0O3q/BuqnQRB7wI8qAkQFhVFnGN5lrQ30SkA1pMbuDPiqN3DmgVIO86
         q/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=07Wd2ltPOkge1nYJdhEJqK1KLAdhWxOlCvX3dPObmpw=;
        b=kJ6Cg+lPrh52A/bC0Zd5eVrGJf+8h/veYknHeh3eANQPmKmyXVQ/YlA5KNa0mXgo3E
         IgpdoPeqDl7RCLB8JB8WtS9UmTroXmWJihmixPcuVLnY/TsQnm+syR5n6DwiypUAqHTM
         da0wEXOOvHNzoRfbtBNbZGjXrDjaDIfePsVaGNjYWJ5gNXhs4nrEZDfyineXjIo3BCYN
         8vXdlao+RXBhBh/bxDFc0plhuOz2TxiaCKbgSQpbwhShpyzISdrTyT2HBJSbqq0zZ98g
         6/Dy2uH7vIOrKBGS2h6vWB3wtqXxxTqhvwrj4dU2PEsZZfs6JWlMvejAbt0gE+YQFOsV
         d2tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b40si16119660pla.277.2019.04.04.00.59.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2019 00:59:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27396E9DA;
	Thu,  4 Apr 2019 07:59:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B04C6E9D5;
 Thu,  4 Apr 2019 07:59:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 00:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; 
 d="asc'?scan'208";a="131358974"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 04 Apr 2019 00:59:39 -0700
Date: Thu, 4 Apr 2019 15:48:34 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: Prevent use-after-free in
 ppgtt_free_all_spt()
Message-ID: <20190404074834.GS2322@zhen-hp.sh.intel.com>
References: <20190404073056.12407-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190404073056.12407-1-chris@chris-wilson.co.uk>
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
Content-Type: multipart/mixed; boundary="===============1654825370=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1654825370==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lt3WynA+XK9Fj6D4"
Content-Disposition: inline


--lt3WynA+XK9Fj6D4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.04 08:30:56 +0100, Chris Wilson wrote:
> ppgtt_free_all_spt() iterates the radixtree as it is deleting it,
> forgoing all protection against the leaves being freed in the process
> (leaving the iter pointing into the void).
>=20
> A minimal fix seems to be to use the available post_shadow_list to
> decompose the tree into a list prior to destroying the radixtree.
>=20
> Alerted by the sparse warnings:
>=20
> drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assignme=
nt (different address spaces)
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
> drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assignme=
nt (different address spaces)
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
> drivers/gpu/drm/i915/gvt/gtt.c:758:45: warning: incorrect type in argumen=
t 1 (different address spaces)
> drivers/gpu/drm/i915/gvt/gtt.c:758:45:    expected void [noderef] <asn:4>=
 **slot
> drivers/gpu/drm/i915/gvt/gtt.c:758:45:    got void **slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in argument=
 1 (different address spaces)
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void [noderef] <asn:4> =
**slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void **slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assignme=
nt (different address spaces)
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
>=20
> This would also have been loudly warning if run through CI for the
> invalid RCU dereferences.
>=20
> Fixes: b6c126a39345 ("drm/i915/gvt: Manage shadow pages with radix tree")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Changbin Du <changbin.du@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index cf133ef03873..9814773882ec 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -750,14 +750,20 @@ static void ppgtt_free_spt(struct intel_vgpu_ppgtt_=
spt *spt)
> =20
>  static void ppgtt_free_all_spt(struct intel_vgpu *vgpu)
>  {
> -	struct intel_vgpu_ppgtt_spt *spt;
> +	struct intel_vgpu_ppgtt_spt *spt, *spn;
>  	struct radix_tree_iter iter;
> -	void **slot;
> +	LIST_HEAD(all_spt);
> +	void __rcu **slot;
> =20
> +	rcu_read_lock();
>  	radix_tree_for_each_slot(slot, &vgpu->gtt.spt_tree, &iter, 0) {
>  		spt =3D radix_tree_deref_slot(slot);
> -		ppgtt_free_spt(spt);
> +		list_move(&spt->post_shadow_list, &all_spt);
>  	}
> +	rcu_read_unlock();
> +
> +	list_for_each_entry_safe(spt, spn, &all_spt, post_shadow_list)
> +		ppgtt_free_spt(spt);
>  }
>

As we ensure to flush post shadow list, so this is safe to reuse.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

>  static int ppgtt_handle_guest_write_page_table_bytes(
> --=20
> 2.20.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--lt3WynA+XK9Fj6D4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKW20gAKCRCxBBozTXgY
JxtOAJ9jq4C/lQ1+Bd3qT1Y19rmLAJyDowCfb/K/kqxdXKlcsvGkBohiITBAsUM=
=SvXj
-----END PGP SIGNATURE-----

--lt3WynA+XK9Fj6D4--

--===============1654825370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1654825370==--
