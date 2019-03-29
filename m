Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1900172ywb;
        Fri, 29 Mar 2019 07:17:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAOHKXW/yAja2CqWQIwz68ly4ZtsLoYdmBETpdHOmyliXZ3f79FcWyPgpK3yjKIZZHARN2
X-Received: by 2002:a62:fb0a:: with SMTP id x10mr42225067pfm.179.1553869026221;
        Fri, 29 Mar 2019 07:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553869026; cv=none;
        d=google.com; s=arc-20160816;
        b=h9Bko1Hghv8IuYQCaGFlk9kdLF8zYZhu/r42An0yOsTU+kvclV3NK3NtRT49IkgN9A
         YLcoob6EcRrRhEyD+E+P1AJppIyFBRBgubdfrxTj8iq0t6Kd1g7AICHyOYkKVClUn6Cd
         PAy7eY/QLcqiZ/yagVDPMO8rZgUHaWorSdoPR+FwlBoxYzeLWV1ArSPwNFzN8RUmhss0
         M1cLwQElP8ZhGktIr8qqw0yrlNbpkFaxRZED7VlRfLTvxMsrDcT5175fKqLzFop1gb62
         EPdQbdtmMSie03j0JqJfX3ZTu+RNMmpZo1w7CUjKu+D9VJ3EJNl672TWU0LlRF1Fhxx1
         fFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:references:in-reply-to:subject:to:to
         :to:from:date:delivered-to;
        bh=D6JPZbYAbDYqg2HnMa6QrBNS6bXNnZpcPMEj2vYUQGg=;
        b=0an4IwfT8DlXornGeOpsx0y3rC5DLBtniNHRdyrtpGRvZi+2GKMGCPO9BSSstQBsbm
         sdL0sS08+ydwNu18YQEMsMfNsetCwIsCHcpdf7spGiH20MvDi8PkwjXmn/VGckgYhelk
         +z3TRMGnpnU1J+i5V2Ctn+vRDz22UeXbIhfyIej1GVT1iXC7fYWEOT20qjI3BVXUxpjV
         50WGU6j7eqb/JvupAxWLSQJranywhUtlONjh97JsV+04EF7kz1hGTlINfw2iws/CUTcB
         ZH8X0p77wd8menECq2b6OTz7QbA4o9cZHFpMltzjxB3FUi6qo17G/czja7iLqIlyhf6O
         QLSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r3si1952385pgp.154.2019.03.29.07.17.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 07:17:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C336E891;
	Fri, 29 Mar 2019 14:17:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A376E891
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2019 14:17:03 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92ABA206C0;
 Fri, 29 Mar 2019 14:17:03 +0000 (UTC)
Date: Fri, 29 Mar 2019 14:17:02 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: do not let pin count of shadow mm go
 negative
In-Reply-To: <20190327045545.16022-1-yan.y.zhao@intel.com>
References: <20190327045545.16022-1-yan.y.zhao@intel.com>
Message-Id: <20190329141703.92ABA206C0@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1553869023;
 bh=NCYzXQlbaOT9Y34rEb4XcHysQeLVJ4U5dT4U1Y+R91I=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=orC7QAg5qYIggi6ujXKnlbsTX3k4pt65nEg1rzv0pCb7ujurB4sMvSyn0kuOiFWWZ
 j0K05Ee0SbT+JcSUsskpjcO+WgXztlyxSkiTY4KecsWSTS1dW6R1crAYN9B0WtsX8u
 yPHsshdetrF9hNU6Byvk5RC1kuqKvEnqNd+cfeu4=
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
Cc: , Yan Zhao <yan.y.zhao@intel.com>, stable@vger.kernel.org,
 zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogMjcwN2U0NDQ2Njg4IGRybS9pOTE1L2d2dDogdkdQVSBncmFwaGljcyBtZW1vcnkgdmlydHVh
bGl6YXRpb24uCgpUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjUuMC41
LCB2NC4xOS4zMiwgdjQuMTQuMTA5LgoKdjUuMC41OiBCdWlsZCBPSyEKdjQuMTkuMzI6IEJ1aWxk
IE9LIQp2NC4xNC4xMDk6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgog
ICAgVW5hYmxlIHRvIGNhbGN1bGF0ZQoKCkhvdyBzaG91bGQgd2UgcHJvY2VlZCB3aXRoIHRoaXMg
cGF0Y2g/CgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
