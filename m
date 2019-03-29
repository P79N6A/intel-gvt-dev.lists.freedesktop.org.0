Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp2019899ywb;
        Fri, 29 Mar 2019 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQKcw3pJZMfwdqXPzdej2Hs5AAt1z/zUOuxK7XdRcNyQPYmNCsFUNxhZ6Ls1db3XqzyttZ
X-Received: by 2002:a65:53cb:: with SMTP id z11mr45233756pgr.139.1553875520583;
        Fri, 29 Mar 2019 09:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553875520; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4ckTic+l9jrZbBGaqJyH34B9IeR8ayKlG8koiVQpqmxuQyT+tBiHuoBn//sCAruZj
         g4qAJKR+MrCbB9nWnjDNcSlXF5njcQgODlU1ZyGnNDHmM5o1qRdixBa+iguAev1KampH
         1nIv6FalLOrCRdGUDFs1BV3UARXk2L9K3aLBCsJ1nq3Hp9V0vcWKPXtUSGEIA+QJRc9h
         wcQtjZ2nwlmksdFMzlQ+kaAdNOttI9dNkrGG6+WjDwlSdPmL1CQFQKre3LWWPba4HUiU
         dCfeaVqo6Hh0IwBHHYLyKTUVBbihBTYw2J/pPmh6ny8/KAVrtvmYvinCdlFMqu0ZGctx
         Xt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=nHmG5xKZFK9ps+ZLVHJXPxmkzR4blesbjGugES0Tz0Y=;
        b=isQOrJC6VribQugajdkd0vhTbUCpKn2A2N9fmu4ONF6OFrD2xrUEkTgRrQkvYz8IxN
         gDcCis9z8wKZGfbWxW6p2jegJQDILdcSid4Ra4jxog8gU3EgKKWg07wqBXhOJRKbQpH0
         tN4EwAZHikLGdacwwrGzR2x8Mosa1Ck/olJ2ViSzjMBWm71p1/yolTA3iHN39cOKjMU5
         6trmyAK2bYw7l4929AYm3cEdhnTQj0rz4W8dr10+rbZbdzxYa9mI4/G9UMwCJZOO+nIj
         KUZ6Z57VKl2cn4widiHkjdOtVmnfVTqZ7QWcjnvfqtSZ4U/UEiHl22a8KTYqgGSY8133
         +Z1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q7si2169652pls.259.2019.03.29.09.05.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 09:05:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048EB6E8E4;
	Fri, 29 Mar 2019 16:05:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500D6E8DE;
 Fri, 29 Mar 2019 16:05:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16064786-1500050 for multiple; Fri, 29 Mar 2019 16:05:06 +0000
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <155387550368.24691.11565135264178401270@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 0/8]  i915 vgpu PV to improve vgpu performance
Date: Fri, 29 Mar 2019 16:05:04 +0000
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTAzLTI5IDEzOjMyOjM2KQo+IFRvIGltcHJvdmUg
dmdwdSBwZXJmb3JtYW5jZSwgaXQgY291bGQgaW1wbGVtZW50IHNvbWUgUFYgb3B0aW1pemF0aW9u
Cj4gc3VjaCBhcyB0byByZWR1Y2UgdGhlIG1taW8gYWNjZXNzIHRyYXAgbnVtYmVycyBvciBlbGlt
aW5hdGUgY2VydGFpbiBwaWVjZQo+IG9mIEhXIGVtdWxhdGlvbiB3aXRoaW4gZ3Vlc3QgZHJpdmVy
IHRvIHJlZHVjZSB2bSBleGl0L3ZtIGVudGVyIGNvc3QuCgpXaGVyZSdzIHRoZSBDSSBmb3IgdGhp
cyBwYXRjaHNldD8gVGhlIGxhY2sgb2YgaW50ZXJydXB0cyB0byBkcml2ZQpzdWJtaXNzaW9uIHNo
b3VsZCBoYXZlIHNob3duIHVwLCBhbmQgaWYgbm90LCB3ZSBuZWVkIHNvbWUgdGVzdGNhc2VzIHRv
Cm1ha2Ugc3VyZSBpdCBkb2Vzbid0IGhhcHBlbiBhZ2Fpbi4gRXZlcnl0aW1lIEkgc2VlIGEgZ3Z0
IHBhdGNoLCBJIGFzayBpZgp3ZSBjYW4gZ2V0IHNvbWUgY292ZXJhZ2UgaW4gaW50ZWwtZ2Z4LWNp
IDopCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXY=
