Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7758793ywe;
        Fri, 8 Mar 2019 00:31:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqypI+VP4UXSiR8YIMJ2X3/1vPrgjr7i9IqqtyIH9WjEvpP7Qm9jT4wrRSykS8Hy+7ZlsEEI
X-Received: by 2002:a62:4684:: with SMTP id o4mr17237643pfi.254.1552033918202;
        Fri, 08 Mar 2019 00:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552033918; cv=none;
        d=google.com; s=arc-20160816;
        b=XN2aPhip2FF7hIEm5K0mF757fl4hOz+KZtXUfMGv2OkyMPjJkT7Vtztm+7NkzccTlO
         HmXcsgvU8Ada3KGnyuatvnM+VNn4CE9lAo4raE1Pt5hiNtO17LuIzF65V8JINeOldBX3
         d87J5yG4LF7Si01JRA8Mw6xh1xv5YSwUr+M3yfmJS7ZynpLvcv/3iwy8K+kUFTRl/9sK
         CX50kpPgQIie4ybt6VKcImWpGxKKyQhHAjYExcgFk+nzoRj+ORqEiZBVp6EUDLrbf4Cu
         pAXjn5cwGVmJNJhquxxnIAQVLTCqj+dmcDxoIXtrlMop/JMakjiH77emluvV0nd0siYF
         IXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=UM3V76P1b1RPuyMMVjluyrqDVtzkldTN6nZ3Sl4/QCM=;
        b=zw/5yHr49nvDAcgaGoqKR5uz3qJ07fwug9bU7qxFteFSJA51pnzgStKz1mY08OKCH4
         GNSqRVdhtfigQdC3WrQufma7PKl096Q4+yBhXFzVnYZlS+4mNDLfe50vZY2gXH9yJlL5
         liq2NqkpQ0tj5pvpfFppbU9mGbfbKBlGHqWLcvoYs4CCwyawYs6BNSgvp9Vw/iFBWbSy
         FRAmsNM03udKeKKw6pxhMV4x1qZdzMo3rdhldvEin+5v+p1Q+4mN1/umszQCyC+A0NBF
         WyFfR8bNVmryx7vrhux44pWMCdNtAmn3SGQaMCBIswoR73IYWv+i8lFdd0nUvn7ZN40d
         O3LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g98si6657406plb.11.2019.03.08.00.31.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 00:31:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C116E2D7;
	Fri,  8 Mar 2019 08:31:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E866A6E2D3;
 Fri,  8 Mar 2019 08:31:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 15819049-1500050 for multiple; Fri, 08 Mar 2019 08:31:53 +0000
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190308075238.1778-1-zhenyuw@linux.intel.com>
References: <20190308075238.1778-1-zhenyuw@linux.intel.com>
Message-ID: <155203390621.27405.3964566776159217086@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: relax debug BUG_ON() for closed context in
 hw_id pin
Date: Fri, 08 Mar 2019 08:31:51 +0000
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

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wMy0wOCAwNzo1MjozNykKPiBDdXJyZW50IEdWVCBj
cmVhdGVkIGNvbnRleHQgaXMgbWFya2VkIGNsb3NlZCBhcyBub3QgdG8gYmUgdXNlZCBmb3IKPiBo
b3N0IHVzZXIuIEJ1dCBpdHMgaHdfaWQgc2hvdWxkIHN0aWxsIGJlIHVzZWQuIFNvIHRoaXMgaXMg
dG8gcmVsYXgKPiBkZWJ1ZyBCVUdfT04oKSBpbiBfX2k5MTVfZ2VtX2NvbnRleHRfcGluX2h3X2lk
KCkgZm9yIEdWVCBjb250ZXh0cwo+IHdoaWNoIGNhbiB1c2UgZm9yY2Ugc2luZ2xlIHN1Ym1pc3Np
b24gZmxhZyB0byBpZGVudGlmeS4KClRoZSBhbHRlcm5hdGl2ZSBzdHJhdGVneSB3b3VsZCBiZSB0
byBhbHdheXMgcGluIHRoZSBpZCBmb3IgR1ZULiBIb3cgbWFueQpndnQgY29udGV4dHM/IE9uZSBw
ZXIgaG9zdCBvciBvbmUgcGVyIGNsaWVudD8gT3Igd2UgZG9uJ3QgbWFyayB0aGVtIGFzCmNsb3Nl
ZCAobm90IHNvIGtlZW4gb24gdGhhdCBhcyBpdCBkb2VzIHByb3ZpZGUgc29tZSBwcm90ZWN0aW9u
KS4KCkkgdGhpbmsgSSdkIHJhdGhlciBkZWxldGUgdGhlIEdFTV9CVUdfT04oKSBpZiBpdCdzIG5v
dCBpbnZhcmlhbnQgLS0gd2UKb25seSBlc2NhcGUgaXQgZmlyaW5nIGZvciBrZXJuZWwgY29udGV4
dHMgYmVjYXVzZSB0aGV5IHBpbiB0aGVpciBpZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
