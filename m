Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2430186ywd;
        Thu, 10 Jan 2019 17:29:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4qiNj+t1QPHFE8jAVmPKuqK2RMXXMJ/nDIQXu2NAIm00JiPV9CWni6kXrIaDGNp49nvz88
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr12514641pll.187.1547170181554;
        Thu, 10 Jan 2019 17:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547170181; cv=none;
        d=google.com; s=arc-20160816;
        b=LWzhb+BwV9wbniVlJ3eXCeD9oAHOZ7RtDv35il3lZnKjX8lxs97wfd2cgiLTK+5UCK
         jFBLQNL5DTgUNGSIeMYr7Vq8tR3SwoA8fT2E5iVVjgW3WiUtlPBtvrfmIi1uOEvEOws8
         AkJl5xs+pUAVrLpUeci1iFfR+LVZuHRcPS9jTzBZFrStYm2rj2HWc1gSnQlOP9Gquc7E
         RCrya+9QRBYeN2JT68NNF2mYbBOhYqETswsICV2nrYSyp8GnFjQqR3fllT9kK3BeP78e
         RHd3zzvxdcJWQXb17q+TzGsQ/alb+WMDUy+c7YO+JDxZpKeM5uZ9NquiuUTbBcFUFYLN
         SUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:delivered-to;
        bh=syQJQ75CZ9+F7EVZ3NEJTZ9S2TtSCGzppSi/QpG0Jnc=;
        b=HH1VLr3MnXfNlN6MUws/5Dxy6PTvuwB6kC7V9vFFKr6frW7aKWq/sExZEaTMobEliI
         v9n8HZRTrd2TmlCvFyGYnyXsNQZC3e9l2YxNmV1hNiAU49RoFyqDNPitCIAQj0vnYtOG
         +enpSzyc0oUltf7rxmUX1eqIbGQHEhGMjUixoIHAvDsmREZiHjoOJ851plVS9KWFLAWv
         4FbMmsWU8g/Em00cVej65M0ezA8wWC2rBCyijDfJNBjpXgJxwg6Bp5/veg1I9YLcS15V
         hb4Pwsd8rfN9sL+jPCvUua+PttZt7diI76OOtauftYUZsqiEKf9EhQq5+Yx206fyIO+K
         r2sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i18si34626717pgl.414.2019.01.10.17.29.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 17:29:41 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B586F4E2;
	Fri, 11 Jan 2019 01:29:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84866F4E2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 01:29:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 17:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,463,1539673200"; d="scan'208";a="105722639"
Received: from henry-optiplex-7050.bj.intel.com (HELO [10.238.157.81])
 ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 10 Jan 2019 17:29:38 -0800
Subject: Re: [PATCH v1 0/4] drm/i915/gvt: add one VFIO graphics EDID region
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <20190110131932.5gzlq6msbtnoy2gw@sirius.home.kraxel.org>
From: Hang Yuan <hang.yuan@linux.intel.com>
Message-ID: <3c63d6e4-b053-c36b-8529-123f7ff143cc@linux.intel.com>
Date: Fri, 11 Jan 2019 09:22:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190110131932.5gzlq6msbtnoy2gw@sirius.home.kraxel.org>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMS8xMC8xOSA5OjE5IFBNLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+IE9uIFRodSwgSmFuIDEw
LCAyMDE5IGF0IDA3OjA0OjQ0UE0gKzA4MDAsIGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20gd3Jv
dGU6Cj4+IEZyb206IEhhbmcgWXVhbiA8aGFuZy55dWFuQGxpbnV4LmludGVsLmNvbT4KPj4KPj4g
Q3JlYXRlIG9uZSBWRklPIGdyYXBoaWNzIEVESUQgcmVnaW9uIGZvciB2Z3B1LiBXaGVuIHRoZSBy
ZWdpb24gaXMgdXBkYXRlZCwKPj4gaG90cGx1ZyBldmVudCBpcyBlbXVsYXRlZCBmb3IgZ3Vlc3Qg
dG8gZ2V0IG5ldyBFRElEIGRhdGEuCj4gCj4gV2hhdCBicmFuY2ggdGhpcyBzZXJpZXMgaXMgYWdh
aW5zdD8KPiBBcHBseWluZyB0byA1LjAtcmMxIGRvZXNuJ3Qgd29yayAuLi4KPiAKPiBjaGVlcnMs
Cj4gICAgR2VyZAo+IApUaGUgcGF0Y2ggc2V0IGlzIGJhc2VkIG9uIGd2dC1zdGFnaW5nIGJyYW5j
aCwgd2hpY2ggaXMgNS4wLXJjMSBhcyB3ZWxsLgoKUmVnYXJkcywKSGVucnkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
