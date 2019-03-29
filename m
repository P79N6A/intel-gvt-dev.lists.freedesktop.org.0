Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1332396ywb;
        Thu, 28 Mar 2019 19:50:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpBa6IH62/cBAK/b34HL0EJoqQKU5JZPkEVamtb+kHxBN53cS6R1HgtXPm5w46uJ3TjGrQ
X-Received: by 2002:a65:60ca:: with SMTP id r10mr43551187pgv.429.1553827837829;
        Thu, 28 Mar 2019 19:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553827837; cv=none;
        d=google.com; s=arc-20160816;
        b=kbsjsiwMrmfnJxmiLkQv5n71oGlzBh2z6enHKPl7I5dDhUrHOQPO+B22Wd5TCTqeot
         k8qoff/2ZF8csTRzIicSIqaj2dQbmxioCNuwckcLjw0gHWfQzYa2q5++AaQKQZAfVOQV
         Y8Gxpu/Jost1gcFECfwUzlkK0yWj4hRN4KlRsiiKRL854R4gpVZxAndZY6hhqHDbZzHL
         NJs3E79MKRDB8lq2yCY1kQGx/DV5H08hwC+IOBw95NdMzb2snslyVsel5hh+s2hc4kfn
         fOYhm/+1kOfWE/epH5v3dBlAfZyVNUYN7RTggz0aALOVr/vJwCQmirwrHkpIq9Nasn/3
         vChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=wIAfC35TwnHyMEk1BJUduMQGKRCmBh577ELiY5BCNwc=;
        b=vcwsh46JWhFlUj8nQw7hDHa3RbG9qO0IvCydlCrk+Tcic62UFoIJ7qndcanR1PRbGi
         9OJL1uGBYbQQ4yhfkmfF1OUP85A305+rdzjgItY2+1xzXZZzIfC5WK/686C0Oc8OjLWt
         fwvRNKbF2/EAxYLXus7BVAsp/UssqbG7FA8CbpIsFnHkGsCX7oUvQuk5g4LQ2T8K+CwA
         pL7/GHQI8bba18VYHh5dm3V3PZHyUZPhO29EKSiKZP+qZR+uQTy/iLjxZvluD/lcTK2B
         sF6qcCWD9i6vDEXGZ1KUcEBsH1hlVYglPtYJLX57T/NpsmRkZHXIlBcvHTXAkggp1F00
         7NEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id c20si682687pfi.259.2019.03.28.19.50.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 19:50:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5D6E80E;
	Fri, 29 Mar 2019 02:50:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654206E80E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2019 02:50:35 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 19:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,282,1549958400"; 
 d="asc'?scan'208";a="156818081"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2019 19:50:33 -0700
Date: Fri, 29 Mar 2019 10:39:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: Change fb_info->size from pages to bytes
Message-ID: <20190329023942.GR10798@zhen-hp.sh.intel.com>
References: <0190326033225.GD10798@zhen-hp.sh.intel.com>
 <1553582728-3354-1-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1553582728-3354-1-git-send-email-xiong.y.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0453395145=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0453395145==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ddnCX6roxAgyKJ1"
Content-Disposition: inline


--1ddnCX6roxAgyKJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.26 14:45:28 +0800, Xiong Zhang wrote:
> fb_info->size is in pages, but some function need bytes when it
> is a parameter. Such as:
> a. intel_gvt_ggtt_validate_range() according to function definition
> b. vfio_device_gfx_plane_info->size according to the comment of
>    its definition
>=20
> This patch change fb_info->size into bytes.
>=20
> v2: Keep fb_info->size in real size instead of assigning casted
>     page size(zhenyu)
> v3: obj->size should be page aligned and delete redundant check(zhenyu)
>=20
> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--1ddnCX6roxAgyKJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJ2FbgAKCRCxBBozTXgY
J6rXAJ47pN9AZ1wOtw+ipaE9IzLb+5fWcACcCx38ScD+i0J+MeDuvqqjEQ+tO3s=
=W48J
-----END PGP SIGNATURE-----

--1ddnCX6roxAgyKJ1--

--===============0453395145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0453395145==--
