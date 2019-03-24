Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp2815258ywb;
        Sun, 24 Mar 2019 10:49:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2LNOD8ZgBWJptndLka58ceCF3RRi2OWdYst3SxTUxKia36z7U9Rk+Zc3crP0U64zIBHmt
X-Received: by 2002:a63:594a:: with SMTP id j10mr19377999pgm.279.1553449742843;
        Sun, 24 Mar 2019 10:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553449742; cv=none;
        d=google.com; s=arc-20160816;
        b=KVLCsur0SAB5RkdyfL/LAmJ00+kho+AkviFG4QKTcM7BnWrhTxiduKTf5pH2udRQfP
         6NWvDOl7yFdwdCzfjmyUwQ7wKLM0ScrXR5jipddj/eDatkMJeClYece0qMYuSlJBZsxe
         i024ZvY3lvT3fG9KoDoO+uCWbDGtryxLatnabxjlA+MHYBdpW4obFZxA3l3aoRThT4Q+
         xHird4eAup2tauKh2SEwiIa8hcHipnKUkCJcCMVphP6DdrAEnpgAyQI9DZE4tqAQwZoY
         8W0FOEp+W28tI1aoyv0ef+GV52x9/+/6f3tAXTi3mi7xTmTILgUh9fHE3mG4DkUyBJbw
         CHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=OjY+FVAT2jI5pX5WPuLUocEQzVagNdAjHoTHtbtdc5o=;
        b=vYA0aoqCFLPlJlnJ29kbzLmCWPuKy31u4Byf8KblAvA0ftZJqwyAYuYmWiVzkdzubA
         QhH1BBv36EwPwvbgZMcV7kNhnsD5t/wbeEjzioEEg/xAyb6QmWw/CSvwdUz+YPfe5yGz
         kFYInKYqwP9AC1NcZRiFwVtpq4WcprNtes9sPPQomxfTRRYAwLm4ET9Krose3LNTsw35
         TvKUdnEo1dLcT0tbWcvuHMG+pqyfXzxUsI+rVllvL9rbtH2VNlOSJHyaXla2HhzbESfx
         BIsVcip9MHYRxbJXALWK9GlBLumUyaEe3NKu4QWJwry7rZ6EVmYM/OjvBfbsKL9wDNDY
         9ikw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id o4si3024135pgp.160.2019.03.24.10.49.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2019 10:49:02 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23536E554;
	Sun, 24 Mar 2019 17:48:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0DD6E3EE;
 Sun, 24 Mar 2019 11:25:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 15999256-1500050 for multiple; Sun, 24 Mar 2019 11:25:32 +0000
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190311023747.1426-1-zhenyuw@linux.intel.com>
References: <20190311023747.1426-1-zhenyuw@linux.intel.com>
Message-ID: <155342673093.15930.7181802050062743719@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: always pin hw_id for GVT context
Date: Sun, 24 Mar 2019 11:25:31 +0000
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wMy0xMSAwMjozNzo0NykKPiBJbml0aWFsbHkgZm91
bmQgaXNzdWUgd2l0aCBjbG9zZWQgY29udGV4dCBkZWJ1ZyBjaGVjayB3aGVuIHBpbgo+IGh3X2lk
IGZvciBHVlQgY29udGV4dCwgbG9va3Mgd2Ugc2hvdWxkIGFsd2F5cyBwaW4gaHdfaWQgZm9yIHRo
YXQKPiBhcyBHVlQgY29udGV4dCBpcyBmaXhlZCBmb3IgZWFjaCB2R1BVIGxpZmUgY3ljbGUsIGFu
ZCB3ZSdkIGFsc28KPiBsaWtlIHRvIGdldCBwaW5uZWQgaHdfaWQgZS5nIGZvciBwZXJmIHJlYXNv
biwgZXRjLgo+IAo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiBTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+ClJl
dmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
