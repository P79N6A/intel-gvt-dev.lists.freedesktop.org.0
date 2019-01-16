Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1366694ywd;
        Wed, 16 Jan 2019 21:35:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6P2XihQfQOZiyRvBFIVl5GbocjKaf7evQ0S7yOO3SKsLg2bFzzok4T9JDTNPa4/kFutJa6
X-Received: by 2002:a65:484c:: with SMTP id i12mr12150233pgs.309.1547703307513;
        Wed, 16 Jan 2019 21:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547703307; cv=none;
        d=google.com; s=arc-20160816;
        b=acYfHMkb4whVcuJ3fKXV+vQdJerm6UY3oNdSGP1xT2AIBj7Qy3Fbnyf/IoXKtFAdj7
         +YCmLa38oS4uUWg5fdeMxJ1vWsNso2BHKsmwGxWTkvEeq6UP0ugdL7UyZY3NOOoCc0gj
         VAmg4G99emPYileOFLVljjmX4hQ4bwoSObXyEAiapTk1X/+Oq8aehNt0AfrDudqgLykI
         4bGeWOUsSltxWELSc89jdNSkgRh3b6IqElnvJVI79zR7p0oLP99cnHmzPpKFdD3h2NSL
         kZVXervhK1bw7wwuyAmMiEoJA7OlfroLWkLRtexNtpQPN+2b1lZ5SXsIKkrjiqWoinU4
         CsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:mime-version:cc:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:message-id
         :references:in-reply-to:subject:to:to:to:from:date:delivered-to;
        bh=jntfSYsQnKvwzrdHcCgjIzJWXLOYR7jyRguskTugA/Q=;
        b=Kcc/aDPwfXG0jPR1fA3KzIeuV/BNGxyAD/mNWch41tF5e+R5/3+pUSUs3CAHYo9ls8
         qdZKohRB2yDkwJR4CXd34GApgGnWUFQddJfPg837Z7HR4zt8BOqSPsZNLhy9kqzwO+7s
         c9CpjfsDChOKX5DAUBWOGY6GANPgicWoB/REdTx5TahvbDUl8WR0O8LLCAFWo1sdikiS
         S8C54AdK9NamG4d+bkbzpuWVYPgoRloEqS8dTwplMhTyuU2Dd6TvQi5WYluadmqGNjxp
         OUq+1tV/MnV4wqiUcm4PbGUYHUpyqm8lSHgRVLyRxT2ltY3396T3hvG9u/pWgvdE5IYW
         KyaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q24si671755pls.325.2019.01.16.21.35.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 21:35:07 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F836F2BF;
	Thu, 17 Jan 2019 05:35:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB7D6ED6A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 16 Jan 2019 13:35:57 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4158F20866;
 Wed, 16 Jan 2019 13:35:57 +0000 (UTC)
Date: Wed, 16 Jan 2019 13:35:56 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gvt: Fix mmap range check
In-Reply-To: <20190111055853.1943-1-zhenyuw@linux.intel.com>
References: <20190111055853.1943-1-zhenyuw@linux.intel.com>
Message-Id: <20190116133557.4158F20866@mail.kernel.org>
X-Mailman-Approved-At: Thu, 17 Jan 2019 05:35:05 +0000
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
Cc: , "Monroy, Rodrigo Axel" <rodrigo.axel.monroy@intel.com>, "Orrala Contreras,
 Alfredo" <alfredo.orrala.contreras@intel.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1603463377=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1603463377==
Content-Type: text/plain

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 659643f7d814 drm/i915/gvt/kvmgt: add vfio/mdev support to KVMGT.

The bot has tested the following trees: v4.20.2, v4.19.15, v4.14.93.

v4.20.2: Build OK!
v4.19.15: Build OK!
v4.14.93: Build failed! Errors:
    drivers/gpu/drm/i915/gvt/kvmgt.c:836:7: error: implicit declaration of function ‘intel_vgpu_in_aperture’; did you mean ‘intel_vgpu_create’? [-Werror=implicit-function-declaration]


How should we proceed with this patch?

--
Thanks,
Sasha

--===============1603463377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1603463377==--
