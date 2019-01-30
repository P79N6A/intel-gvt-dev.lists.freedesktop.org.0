Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp5105616ywd;
        Tue, 29 Jan 2019 19:09:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7+46w4pWNBolFtXCDHhiqYCTF7HOXJncZ0Wsyc8ca+BmU0YbuJCH4C8IO8h9SCD6dbQAKi
X-Received: by 2002:a63:101:: with SMTP id 1mr26059984pgb.152.1548817774291;
        Tue, 29 Jan 2019 19:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548817774; cv=none;
        d=google.com; s=arc-20160816;
        b=TayY7EE19+WTUvuIzF/Gjy+oNzN4m3ZHnv3hPpMwNvFP63YYGx2kaKSm66Wwsr0m5C
         7UkE2i53IHfpcZjcmqo6bqONlTY7aoEoE0vKLBOt19+sgn+JohGvp5DTS6VjQaU4Rrrw
         p2Qo1+29RrSJ+si2PDGatPeDjetXDHrPNwQaXyX7vFA0nomTADahwB6DQ/BHEwHbDIUQ
         ucVe+tWDUmrt0+cBY3FOXg6Ic/porsVH0vJV52Ovd0YBu73Jwh3Mq2NnU/h4nEgLAlUw
         7h1mXiiVl5fTMKsRS4KbP57E1wL9Nq5tfGA6xCISVm0XBOmPCt/zZB7GNbTvRYLih+VN
         Uieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=yB9zTW9MaF4bD/CoGPDGc57cEOprqZY9SjNdOeMyT5k=;
        b=MFdNPl6PWEo61v9P2qBY2GE57l/lQv9fB/SAcYavYBG8lYrtZ3KI8stoRIU9d0o4B/
         EDW4y/Gj45T+Up0iuprkV9BUGDC3NK9kgbtyez1oFvnEgpvNs6FmS5I61ye3jWmkyLTM
         Rz2BXFH7r0+TW8i8utkJjLa1XaE7Fn0hMinj+XC8ojBUmQfrAkBe3B0nsAMkBGX7qbnO
         Oi9uXfKkxYVd4w7FcY2o255ZtVvEjy34iatWRXeRosZCwHESX9uBPsCpnOqhA59jsBpg
         3/iRNRsU7z7Xi6YQ6z0A7ETI6FdeKf5cMIs9Pv8U9fFVf8gcmxxy0JX5oC0KPeYYRt5v
         EfGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id p12si303141pgj.56.2019.01.29.19.09.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jan 2019 19:09:34 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8786F6EAB4;
	Wed, 30 Jan 2019 03:09:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216BC6EAB4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Jan 2019 03:09:32 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2019 19:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,539,1539673200"; 
 d="asc'?scan'208";a="112180445"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 29 Jan 2019 19:09:30 -0800
Date: Wed, 30 Jan 2019 11:00:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Feng Tang <feng.tang@intel.com>
Subject: Re: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos page
 setup
Message-ID: <20190130030042.GC7203@zhen-hp.sh.intel.com>
References: <1548643580-91046-1-git-send-email-feng.tang@intel.com>
 <01363028D91B0B448414F51B4258CAA574C168BE@SHSMSX101.ccr.corp.intel.com>
 <20190128035305.g47wijqaob6evsbp@shbuild888>
MIME-Version: 1.0
In-Reply-To: <20190128035305.g47wijqaob6evsbp@shbuild888>
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
Cc: "Zhao, Yakui" <yakui.zhao@intel.com>, "He, Min" <min.he@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0691714791=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0691714791==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8EXHJdkEfksMlRxO"
Content-Disposition: inline


--8EXHJdkEfksMlRxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.28 11:53:05 +0800, Feng Tang wrote:
> Hi Yakui,
>=20
> Thanks for the review!
>=20
> On Mon, Jan 28, 2019 at 11:28:28AM +0800, Zhao, Yakui wrote:
> >=20
> >=20
> > >-----Original Message-----
> > >From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.or=
g] On
> > >Behalf Of Feng Tang
> > >Sent: Monday, January 28, 2019 10:46 AM
> > >To: intel-gvt-dev@lists.freedesktop.org; Zhenyu Wang
> > ><zhenyuw@linux.intel.com>; Wang, Zhi A <zhi.a.wang@intel.com>; Xiao
> > >Zheng <xiao.zheng@intel.com>; He, Min <min.he@intel.com>; Bing Niu
> > ><bing.niu@intel.com>
> > >Cc: Tang, Feng <feng.tang@intel.com>
> > >Subject: [RFC PATCH] drm/i915/gvt: Try cma allocation first for oos pa=
ge setup
> > >
> > >When doing boottime profiling, we found the oos page setup takes about
> > >25~30 ms, while using cma allocation takes less than 10 ms. And if the
> > >preallocated_oos_pages increases in future, it will save more.
> > >
> > >This commit will try to allocate the memory from CMA first, and fall b=
ack to
> > >the original kzalloc if CMA is not available.
> > >
> > >Signed-off-by: Feng Tang <feng.tang@intel.com>
> > >---
> > > drivers/gpu/drm/i915/gvt/gtt.c | 26 +++++++++++++++++++++-----
> > > 1 file changed, 21 insertions(+), 5 deletions(-)
> > >
> > >diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt=
/gtt.c
> > >index c7103dd..e8d6f10 100644
> > >--- a/drivers/gpu/drm/i915/gvt/gtt.c
> > >+++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > >@@ -2496,18 +2496,34 @@ static void clean_spt_oos(struct intel_gvt *gv=
t)
> > >static int setup_spt_oos(struct intel_gvt *gvt)  {
> > > 	struct intel_gvt_gtt *gtt =3D &gvt->gtt;
> > >-	struct intel_vgpu_oos_page *oos_page;
> > >+	struct intel_vgpu_oos_page *oos_page, *oos_page_base;
> > >+	struct page *cma_page;
> > >+	int npages;
> > > 	int i;
> > > 	int ret;
> > >
> > > 	INIT_LIST_HEAD(&gtt->oos_page_free_list_head);
> > > 	INIT_LIST_HEAD(&gtt->oos_page_use_list_head);
> > >
> > >+	/* Try cma allocation first to save setup time */
> > >+	npages =3D preallocated_oos_pages * sizeof(*oos_page);
> > >+	npages =3D DIV_ROUND_UP(npages, PAGE_SIZE);
> > >+
> > >+	cma_page =3D dma_alloc_from_contiguous(NULL, npages, 1, TRUE);
> > >+	if (cma_page) {
> > >+		oos_page_base =3D page_address(cma_page);
> > >+		memset(oos_page_base, 0, npages << PAGE_SHIFT);
> > >+	}
> > >+
> >=20
> > Currently it will try to call kzalloc for 8192 times.
> > So can we firstly use the kcalloc to allocate the memory for all the *o=
os_page and
> > then initialize the oos_page list?
>=20
> One concern with this is the size of the oos memory is about 33M, while k=
malloc
> may not be able to allocate so big a block (MAX_ORDER is about 11, which =
is 8MB).
>=20
> Another question is if the kzalloc is necessary for this setup, while kma=
lloc
> will consume much less time.
>=20
> >=20
> > For the CMA: we need to reserve some regions for CMA. This is not recom=
mended.
> This cma allocation is a one-time deal in boot phase, which should be fin=
e. Also
> for platform with no cma explicitly allocated, this is a nop.
>=20

So I don't think we should depend on possible special cma config for benefi=
t,
we should have solution in normal case. But currently GVT doesn't use oos p=
age
actually, so better just skip all those setup now, would you send a patch f=
or that?

btw, oos code seems pretty lame, surely need to rework if we'd really like =
to
use it, otherwise may just remove.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--8EXHJdkEfksMlRxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXFETWgAKCRCxBBozTXgY
JxCsAKCXxTd4wyeAwJdnAUOr0SFxalcN5ACgkbs/GquAVCwrnUNmnNIoyB+MFUU=
=7raX
-----END PGP SIGNATURE-----

--8EXHJdkEfksMlRxO--

--===============0691714791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0691714791==--
