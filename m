Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1812056ywe;
        Fri, 22 Feb 2019 12:50:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iazjbcg7ZCG+VDQ+0chNnLNLMROZFntFIsL94qcXU0JstIbpXcjCkGF2gqRgip/XnwpK10H
X-Received: by 2002:a62:388a:: with SMTP id f132mr6103091pfa.150.1550868620832;
        Fri, 22 Feb 2019 12:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550868620; cv=none;
        d=google.com; s=arc-20160816;
        b=Nz6hjGdTmLafFiIgl5nMOuD9diuKVM2HJgkPuLP0X7fMQ/FPCuwBmMubWCWWEkQ54r
         QU3pJS7tEe4FMRzoWvGc46JaMS7jZR9nOAWqiZEVSp/ZNsXFTPvVQQbqBowOaWqABmbi
         n2zrbpmK7NJxIGfYXazUyFSCAh8+p3evNMCYfKjXWVEoKjW1404qiBne6XOSfRnMAw6b
         mtgfaKAfe9GS+Pb0s83PthHqVzKzAYzId3ofPhutw1AE16ltyxHm3k1z3Q9k5kijeoOY
         S9lpKptHNfeUO5/rrjO2MRnDJBwEQu2CKqL3ONZAe4HywJku/CSlcOW+5ur3UhNHyH4s
         s7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=gQMo8Z8iQaqgGhJMZ2qJDSM+qm7C2lZ9pjTxIgrO26M=;
        b=m2ekhHyj7i0coLa4I0y0X2gLfLUXyw1kLmhNdJfXoki3aSETkCl8DA3DJHzPeOv9+A
         GUZszFSr6hUbCd/bJG1Gf+0Z+O+vWq4fR4b9FrSETEOfzzmKz1yW5iRJAm6EM+Byn5/R
         eHZWf2W+uMqjLFUP0CmXvRnZUPBP6EBNSn6igu8pWhrjyR2Ao1m1eErgLd+4EN/vC63X
         l3PC2XxsCtUKePlEPSZ5upYvAIDugVMdi2pim2hy5irKcBaFgMk9l+gBU/E1J397PF7g
         kpjDu0dcIWYdp4UFd9d5kT2ujEAOr5jn7eFlnqgcwq2yTgiGxmMWawFUzP8w7EnqwKM/
         kt1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id u3si2102641pls.421.2019.02.22.12.50.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 12:50:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF65894E3;
	Fri, 22 Feb 2019 20:50:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212E1894E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 20:50:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8355B308222F;
 Fri, 22 Feb 2019 20:50:17 +0000 (UTC)
Received: from x1.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5317C5D704;
 Fri, 22 Feb 2019 20:50:15 +0000 (UTC)
Date: Fri, 22 Feb 2019 13:50:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: Windows 10 VM blacked-out text
Message-ID: <20190222135014.32220841@x1.home>
In-Reply-To: <20190222053325.GY12380@zhen-hp.sh.intel.com>
References: <20190221084307.53322ef9@w520.home>
 <20190222051855.GV12380@zhen-hp.sh.intel.com>
 <20190222053325.GY12380@zhen-hp.sh.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 22 Feb 2019 20:50:17 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBGZWIgMjAxOSAxMzozMzoyNSArMDgwMApaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBPbiAyMDE5LjAyLjIyIDEzOjE4OjU1ICswODAwLCBa
aGVueXUgV2FuZyB3cm90ZToKPiA+IE9uIDIwMTkuMDIuMjEgMDg6NDM6MDcgLTA3MDAsIEFsZXgg
V2lsbGlhbXNvbiB3cm90ZTogIAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IEknbSBydW5uaW5nIGEg
aG9zdCBrZXJuZWwgYmFzZWQgb24gTGludXMnIHRyZWUgbWVyZ2VkIHdpdGgKPiA+ID4gZ3Z0LW5l
eHQtMjAxOS0wMi0wMSBpbiBvcmRlciB0byB0ZXN0IEVESUQgc3VwcG9ydC4gIFFFTVUgaXMgbGF0
ZXN0Cj4gPiA+IHFlbXUuZ2l0IHdpdGggR2VyZCdzIEVESUQgcGF0Y2hlcyBhcHBsaWVkLiAgR3Vl
c3QgaXMgV2luZG93cyAxMCwgZnVsbHkKPiA+ID4gdXBkYXRlZCwgZGV2aWNlIG1hbmFnZXIgc2hv
d3MgSW50ZWwgZ3JhcGhpY3MgZHJpdmVyIHZlcnNpb24KPiA+ID4gMjUuMjAuMTAwLjY0NzIuICBJ
IHRyaWVkIHRvIGluc3RhbGwgdGhlIGxhdGVzdCBEQ0ggSW50ZWwgZ3JhcGhpY3MKPiA+ID4gZHJp
dmVycyBidXQgaWYgZmFpbGVkIHRvIGluc3RhbGwuICBBcyBzZWVuIGluIHRoZSBhdHRhY2hlZCBp
bWFnZSwgdGhlCj4gPiA+IGRlc2t0b3AgaGFzIHNvbWUgZnVuZGFtZW50YWwgdXNhYmlsaXR5IGlz
c3VlcyB3aXRoIGNlcnRhaW4gdGV4dCBmaWVsZHMKPiA+ID4gYmVpbmcgYmxhY2tlZCBvdXQuICBG
b3IgdGhpcyByZWFzb24gSSBoYXZlIG5vIGlkZWEgd2h5IHRoZSBuZXcgRENICj4gPiA+IGRyaXZl
ciBmYWlsZWQgdG8gaW5zdGFsbC4gIEhvdyBkbyBJIGdldCBhIHVzYWJsZSBHVlQtZyBWTSBkZXNr
dG9wPwo+ID4gPiAgCj4gPiAKPiA+IFdlIGhhdmUgaWRlbnRpZmllZCB0aGF0IHRoZXJlJ3MgYSBj
aGlja2VuIGJpdCByZWdpc3RlciB3aGljaCBjb3VsZAo+ID4gaW1wYWN0IHJlbmRlciBiZWhhdmlv
ciB0aGF0IG5lZWQgdG8gYmUgcmVzdG9yZWQgZm9yIGRpZmZlcmVudCBWTS4KPiA+IENvbGluIHdp
bGwgc2VuZCBhIHBhdGNoIHZlcnkgc29vbi4KPiA+ICAgCj4gCj4gQWxleCwgY291bGQgeW91IHRy
eSB0aGlzIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yODczOTQvPwo+
IFdpbGwgbWVyZ2UgaXQsIG9uY2UgaXQgcGFzc2VkIG91ciBDSSB0ZXN0LCB3aWxsIHNlbmQgcHVs
bCBmb3IgdXBzdHJlYW0uCgpZZXMsIHRoaXMgcmVzb2x2ZXMgaXQuICBUaGFua3MsCgpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
