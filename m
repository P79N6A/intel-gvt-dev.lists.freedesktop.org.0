Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp9285334ywe;
        Sat, 9 Mar 2019 09:41:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqy6VIlfAaezwvUV+lrgG0SXpQ6+1GguDB2Koy6F1gk5V6C5yrqajmY1EYP9KG2BbLrjRMPv
X-Received: by 2002:a62:574d:: with SMTP id l74mr25144497pfb.9.1552153288347;
        Sat, 09 Mar 2019 09:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552153288; cv=none;
        d=google.com; s=arc-20160816;
        b=m7j2yGWthmXJjl7on1q3g7Ickbty03lYeZVHTeornOZKKRDbGxP7mPajFabdT4OTwE
         RRRwDb9Ce3lahpMBGFsc2GTsufhfHo2idMzzZ8/SpviH/B5SCI49xaPRZnpHVisfUNaD
         i0AjPbEvprj3BHjwlGiD/i5GCuy8r4yZ6hZMGG+9p0qg8UUB/rfG9XRcGjk26nSUCsZy
         JaYNdEEUhMTc1F+qWtUuXu8qgIUefYE9+Iwuap5kOe8WhrBu+PHqOiyWjbsaREeQQ1nF
         jweAQhj3/G6VP+02hVlOMjb0RXSgaXCjtjhcXbkxV7yFf7Pwdxf7YqHK6mZh0GTVnR6F
         tFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=IjnnmzzegKZ9rqIsqLreNiUU19auGBcIOGEISBz4AVk=;
        b=oopWLAMdUUl1Hs25RTF9rn1qDbzxziaUscjPyy9zakujb76gBBdfaUSV9szUzyOfxg
         5BuENhKv/jF8kf/+Ew3Juy0/j7nmuIAy2V7I+c3xU2QdjaoVEklPPuX49oTilKSlaBIa
         EpOTAp+oR7DgIEOJQ9VJGESNf9zy4hru/QP4mKbED/YCK9ET8WpE4IshXYYMFWpx1J5Q
         wNF6oLtIlxy/7b0r8NGSNl5hX8BCj/XMBFu6Wg9GGxkPsOk81akRu+DOzTteQnlD2N+R
         lgdFMuoC3z7AZlR9VUC7C155wvmjC680shUuu+hqEGgftcQgKiCfP3LdiVy5imEcWEpZ
         XGeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a20si924372pgw.64.2019.03.09.09.41.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2019 09:41:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E86E89E41;
	Sat,  9 Mar 2019 17:41:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991D89DF9;
 Sat,  9 Mar 2019 17:41:25 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 15835968-1500050 for multiple; Sat, 09 Mar 2019 17:41:23 +0000
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190309033936.GA27119@zhen-hp.sh.intel.com>
References: <20190308075238.1778-1-zhenyuw@linux.intel.com>
 <155203390621.27405.3964566776159217086@skylake-alporthouse-com>
 <20190309033936.GA27119@zhen-hp.sh.intel.com>
Message-ID: <155215327506.28502.9201976198004566455@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: relax debug BUG_ON() for closed context in
 hw_id pin
Date: Sat, 09 Mar 2019 17:41:20 +0000
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wMy0wOSAwMzozOTozNikKPiBPbiAyMDE5LjAzLjA4
IDA4OjMxOjUxICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFpoZW55dSBX
YW5nICgyMDE5LTAzLTA4IDA3OjUyOjM3KQo+ID4gPiBDdXJyZW50IEdWVCBjcmVhdGVkIGNvbnRl
eHQgaXMgbWFya2VkIGNsb3NlZCBhcyBub3QgdG8gYmUgdXNlZCBmb3IKPiA+ID4gaG9zdCB1c2Vy
LiBCdXQgaXRzIGh3X2lkIHNob3VsZCBzdGlsbCBiZSB1c2VkLiBTbyB0aGlzIGlzIHRvIHJlbGF4
Cj4gPiA+IGRlYnVnIEJVR19PTigpIGluIF9faTkxNV9nZW1fY29udGV4dF9waW5faHdfaWQoKSBm
b3IgR1ZUIGNvbnRleHRzCj4gPiA+IHdoaWNoIGNhbiB1c2UgZm9yY2Ugc2luZ2xlIHN1Ym1pc3Np
b24gZmxhZyB0byBpZGVudGlmeS4KPiA+IAo+ID4gVGhlIGFsdGVybmF0aXZlIHN0cmF0ZWd5IHdv
dWxkIGJlIHRvIGFsd2F5cyBwaW4gdGhlIGlkIGZvciBHVlQuIEhvdyBtYW55Cj4gPiBndnQgY29u
dGV4dHM/IE9uZSBwZXIgaG9zdCBvciBvbmUgcGVyIGNsaWVudD8gT3Igd2UgZG9uJ3QgbWFyayB0
aGVtIGFzCj4gPiBjbG9zZWQgKG5vdCBzbyBrZWVuIG9uIHRoYXQgYXMgaXQgZG9lcyBwcm92aWRl
IHNvbWUgcHJvdGVjdGlvbikuCj4gPgo+IAo+IEN1cnJlbnRseSBvbmUgcGVyIFZNIGd1ZXN0LCBh
bHdheXMgcGluIHRoZSBpZCB3b3VsZCBhbHNvIGJlIGdvb2QuCj4gCj4gPiBJIHRoaW5rIEknZCBy
YXRoZXIgZGVsZXRlIHRoZSBHRU1fQlVHX09OKCkgaWYgaXQncyBub3QgaW52YXJpYW50IC0tIHdl
Cj4gPiBvbmx5IGVzY2FwZSBpdCBmaXJpbmcgZm9yIGtlcm5lbCBjb250ZXh0cyBiZWNhdXNlIHRo
ZXkgcGluIHRoZWlyIGlkLgo+IAo+IEkgdGhpbmsgYW55d2F5IHdlJ2QgYmV0dGVyIHBpbiBpZCBm
b3IgZ3Z0IGNvbnRleHQsIGFzIGl0J3MgZ29vZCB0byBrZWVwCj4gaXQgZm9yIG9uZSBWTSBjeWNs
ZS4KClBpbiBhd2F5LCBJIGhhdmUgYSBwbGFuIHRvIHJlbW92ZSB0aGUgaHctaWQgbGltaXQuLi4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
