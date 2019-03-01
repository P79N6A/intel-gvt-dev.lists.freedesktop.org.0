Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp315949ywe;
        Thu, 28 Feb 2019 23:49:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUwXyItP3bJjrNAIqcctSx0IJ5ot/VTDTKkqmB8mU0IrN8amwn3KX4J+R03Ela8MD4KFLV
X-Received: by 2002:a17:902:2a29:: with SMTP id i38mr4084158plb.110.1551426553894;
        Thu, 28 Feb 2019 23:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551426553; cv=none;
        d=google.com; s=arc-20160816;
        b=ILVbtSbdCfSxGf29f6MhO1zI1QuNyv+2cfNZx3NSqjDC6NZe1bomsmWtRmhMXwl6TA
         HkVx9T2vkrI06dK+IzRifNSUpGY0wjdm/ZdZswPx95kCY2Dzse3L9kFuVOx/IsDx1okn
         lr7mhzaMhbOuo4HHyubVUYHQGlBo2MmhiLB2Elsa65xHHlFOHvUsXfrlcQHYNdV5uRgy
         yOq5VBFdViq9IHRNLxjZDXNdqZ1GNMwdgwbWtjJLNQ7fVgXxiWLityLsd1Gz6QkyhM9h
         RKsKn+UZk+5YbSemeYo2TFhkjNYJy/RfvjwrcuV1yU3aNdZsrswRmdHKMjhTiJWwHZJ4
         oP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=+vvMMlJOH4Nx7EQbp4qDUgKJ+OarPi7Wa1SFk4LyN0Y=;
        b=P48NFhrzroo+NLX6HoHGNpO1yEx32XNt/mFPJuXzyR84kU3ObzKECSUvBlDprB/9Bw
         CQZwFggUMLLjW5Soz3WJrMA8bh8zTG4IyClIT5fAEBE5qXEoTPqZudmJ8HfSUIAn0z8t
         xctmhhRS7rnEFur6sk0pDwPa8Z/VTvypMUY1KeZgbmV0YXuSShAPQuAMCzqz3Sgcj2EH
         b+nz0Areey0qqBxw4AFuelNQdeQchMiJ84446S3kATFvNLPCQ4ssqtz0fwm2643zySnS
         DqeETyXuLQZgoO+l2Am4y4vCHv9loBZAdx7dZ1i+rBhVGknlq1r3ghKySAjvLRBdy7Zq
         LTEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 39si20333757ple.354.2019.02.28.23.49.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 23:49:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1681189A4A;
	Fri,  1 Mar 2019 07:49:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497389A4A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 07:49:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 23:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,426,1544515200"; 
 d="asc'?scan'208";a="324434743"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2019 23:49:10 -0800
Date: Fri, 1 Mar 2019 15:39:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Weinan Li <weinan.z.li@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: stop scheduling workload when vgpu is
 inactive
Message-ID: <20190301073918.GK12380@zhen-hp.sh.intel.com>
References: <1551253018-16671-1-git-send-email-weinan.z.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <1551253018-16671-1-git-send-email-weinan.z.li@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2025600722=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2025600722==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s6wyrSjGudquIOT1"
Content-Disposition: inline


--s6wyrSjGudquIOT1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.27 15:36:58 +0800, Weinan Li wrote:
> There is one corner case that workload_thread may pick and dispatch one
> workload of vgpu after it's already deactivated. Below is the scenario:
>=20
> 1. deactive_vgpu got the vgpu_lock, it found pending workload was
> submitted, then it released the vgpu_lock and wait for vgpu idle.
> 2. before deactive_vgpu got the vgpu_lock back, workload_thread might pick
> one new valid workload, then it was blocked by the vgpu_lock.
> 3. deactive_vgpu got the vgpu_lock again, finished the last processes of
> deactivating, then release the vgpu_lock.
> 4. workload_thread got the vgpu_lock, then it will try to dispatch the
> fetched workload. It's not expected one workload of deactivated vgpu is
> dispatched.
>=20
> The solution is to add condition check of the vgpu's active flag and stop
> to schedule when it's inactive.
>=20
> Signed-off-by: Weinan Li <weinan.z.li@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 1bb8f93..2bcb701 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -739,7 +739,8 @@ static struct intel_vgpu_workload *pick_next_workload(
>  		goto out;
>  	}
> =20
> -	if (list_empty(workload_q_head(scheduler->current_vgpu, ring_id)))
> +	if (!scheduler->current_vgpu->active ||
> +	    list_empty(workload_q_head(scheduler->current_vgpu, ring_id)))
>  		goto out;
> =20
>  	/*

looks sane to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--s6wyrSjGudquIOT1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXHjhpgAKCRCxBBozTXgY
J/LJAJ9UP7GR2EIiKwQnTXbWqEZ9+B21YQCfV92XYyAOxjK12rQ+T507h6BzF54=
=aLTB
-----END PGP SIGNATURE-----

--s6wyrSjGudquIOT1--

--===============2025600722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2025600722==--
